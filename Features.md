# AltheaCare Pharmacy Partner – Features Documentation

## What This App Does

**AltheaCare Pharmacy Partner** is a Flutter-based pharmacy management application built for pharmacy owners and their staff who are registered as partner outlets on the AltheaCare health-delivery platform. The app is the critical verification and fulfillment layer between a patient placing a medicine order and a delivery partner picking it up. It handles the full lifecycle of a medicine order — from arrival notification through prescription verification, item checking, invoice generation, QR-code handoff to the delivery partner, and live delivery tracking — while also managing inventory, earnings, staff, and compliance information.

The app targets **mobile, tablet, and desktop** form factors and adapts its layouts responsively. All repository data currently uses in-memory mock repositories; the architecture cleanly separates domain logic from data sources so a real backend can be substituted without touching UI code.

---

## Architecture Overview

The project follows **Clean Architecture** with three distinct layers per feature:

```
lib/
├── core/                          # Shared utilities, theme, routing, permissions
│   ├── providers/                 # Cross-cutting Riverpod providers
│   ├── router/                    # GoRouter configuration
│   ├── theme/                     # Colours, typography, gradients, URLs
│   └── utils/                     # Extensions, responsive helpers, platform utilities
└── features/
    ├── auth/
    ├── orders/
    ├── inventory/
    ├── wallet/
    ├── analytics/
    ├── notifications/
    ├── profile/
    ├── settings/
    ├── staff_management/
    └── legal/
```

Each feature folder has:

| Sub-folder | Purpose |
|---|---|
| `domain/entities/` | Immutable data classes (Freezed), pure business logic |
| `domain/repositories/` | Abstract repository contracts |
| `domain/usecases/` | Single-responsibility use-case classes (where present) |
| `data/models/` | JSON-serialisable data-layer models with `toEntity()` / `fromEntity()` |
| `data/repositories/` | Concrete repository implementations (currently mock) |
| `data/services/` | Service classes for side effects (PDF generation, CSV export) |
| `presentation/providers/` | Riverpod `@riverpod` notifiers and Freezed state unions |
| `presentation/screens/` | Full-page widgets |
| `presentation/widgets/` | Reusable, composable UI components |

**State management:** Flutter Riverpod (`riverpod_annotation` / code-gen). Every notifier exposes a Freezed union state that follows the pattern `initial | loading | loaded(...) | error(String)`.

**Routing:** GoRouter with a single `appRouterProvider` Riverpod provider. All routes are nested under `/home`, which keeps the app drawer accessible from everywhere.

**Offline storage:** Hive (initialised at startup) for local persistence; `SharedPreferences` for auth session tokens.

---

## Permission System

The permission system is global and governs which UI elements and actions are visible to the currently logged-in user.

### Models

#### `UserRole` (enum)
```
admin | staff
```

#### `Permission` (enum)
Granular capability flags:
- **Orders:** `viewOrders`, `acceptOrders`, `rejectOrders`, `cancelOrders`
- **Inventory:** `viewInventory`, `addInventory`, `editInventory`, `deleteInventory`, `adjustStock`
- **Wallet:** `viewWallet`, `withdrawFunds`, `viewTransactions`
- **Profile:** `viewProfile`, `editProfile`, `editBankDetails`
- **Settings:** `viewSettings`, `editSettings`, `manageUsers`
- **Notifications:** `viewNotifications`, `deleteNotifications`

#### `RoleEntity` (Freezed)
Wraps a `UserRole` with a `List<Permission>` and a `hasPermission(Permission)` helper. Two predefined singleton roles exist:
- `RoleEntity.admin` – all permissions granted.
- `RoleEntity.staff` – read-only wallet, no fund withdrawal, no profile editing, no user management, no inventory deletion.

### Providers

| Provider | Type | Purpose |
|---|---|---|
| `currentUserRoleProvider` | `RoleEntity?` | Derives the logged-in user's role from `authProvider` |
| `hasPermissionProvider(Permission)` | `bool` | Widget-level gating – returns `true` if role contains the permission |

### Data Flow
```
authProvider (UserEntity?) ──► currentUserRoleProvider (RoleEntity?)
                                        │
                                        ▼
                            hasPermissionProvider(permission)
                                        │
                         ┌─────────────┴───────────────────────┐
                         ▼                                       ▼
               Drawer menu items shown/hidden        FAB / action buttons shown/hidden
```

---

## Feature 1 – Authentication

### What It Does
Handles splash-screen auto-login, credential-based login, forgot-password flow, and session-aware logout.

### Entities

#### `UserEntity` (Freezed)
| Field | Type | Description |
|---|---|---|
| `id` | `String` | Unique user identifier |
| `email` | `String` | Login email |
| `name` | `String` | Display name |
| `pharmacyId` | `String` | Associated pharmacy |
| `pharmacyName` | `String` | Human-readable pharmacy name |
| `role` | `RoleEntity` | Embedded role with permissions |
| `photoUrl` | `String?` | Optional avatar URL |

#### `UserModel` (Freezed + JSON)
Data-layer model that stores `roleString` (a plain string) for JSON serialisation. Converts to/from `UserEntity` via `toEntity()` / `fromEntity()`.

### Repository
`AuthRepository` abstract interface:
- `login(email, password)` → `Either<String, UserEntity>`
- `logout()` → `Either<String, void>`
- `getCurrentUser()` → `Either<String, UserEntity?>`
- `changePassword(userId, currentPassword, newPassword)` → `Either<String, void>`
- `forgotPassword(email)` → `Either<String, void>`
- `resetPassword(token, newPassword)` → `Either<String, void>`

`MockAuthRepository` persists login state to `SharedPreferences` (keys: `is_logged_in`, `user_id`, `user_name`, `user_email`, `pharmacy_name`).

### Provider & State

`Auth` is an `AsyncNotifier<UserEntity?>` generated by `@riverpod`:
- On build: calls `getCurrentUser()` to restore session.
- `login()`: sets state to `AsyncLoading`, calls repository, returns `UserEntity` or throws.
- `logout()`: clears session and sets state to `null`.
- `changePassword()`, `forgotPassword()`, `resetPassword()`: delegate to repository and return `bool`.

`AuthState` (Freezed union, used separately in some places):
```
initial | loading | authenticated(UserEntity) | unauthenticated | error(String)
```

### Screens & Widgets

| Screen | Path | Description |
|---|---|---|
| `SplashScreen` | `/splash` | Listens to `authProvider`; auto-navigates to `/home` if session exists, else `/login`. Safety timeout of 5 seconds. |
| `LoginScreen` | `/login` | Gradient background. Contains `LoginForm` widget. Listens for `authProvider` data changes to push to `/home`. |
| `ForgotPasswordScreen` | `/forgot-password` | Email submission form. Switches to a "link sent" confirmation state on success. |
| `ChangePasswordScreen` | `/change-password` | Current + new + confirm password form. Accessible from Settings. |

### Data Flow
```
SplashScreen
    └── ref.listen(authProvider)
            ├── user != null ──► context.go('/home')
            └── user == null ──► context.go('/login')

LoginScreen
    └── LoginForm
            └── ref.read(authProvider.notifier).login(email, password)
                    └── MockAuthRepository.login()
                            └── SharedPreferences.setBool('is_logged_in', true)
                    └── authProvider state = UserEntity
    └── ref.listen(authProvider) data(user != null) ──► context.go('/home')
```

---

## Feature 2 – Orders Management

### What It Does
The central feature of the app. Displays incoming medicine orders in a queue, lets pharmacy staff verify item availability, accept or reject orders, generate PDF invoices, produce QR codes for delivery partner handoff, and track live delivery via Google Maps.

### Entities

#### `OrderStatus` (enum)
```
pending → reviewing → accepted → preparingInvoice → readyForPickup
→ pickedUp → outForDelivery → delivered
                  (or) → rejected / cancelled
```

#### `OrderPriority` (enum)
```
normal | urgent | emergency
```

#### `ItemAvailability` (enum)
```
available | unavailable | substituted
```

#### `OrderEntity` (Freezed)
| Key Fields | Type | Description |
|---|---|---|
| `id` | `String` | Internal UUID |
| `orderId` | `String` | Human-readable order reference |
| `customerName/Phone/deliveryAddress` | `String` | Delivery destination |
| `distance` | `double` | km from pharmacy |
| `orderTime` | `DateTime` | Placement timestamp |
| `status` | `OrderStatus` | Current lifecycle stage |
| `priority` | `OrderPriority` | Triage level |
| `items` | `List<OrderItemEntity>` | Line items |
| `totalAmount` | `double` | Gross order value |
| `prescriptionUrl` | `String?` | Image URL of attached prescription |
| `invoiceUrl` | `String?` | Generated PDF link |
| `qrCode` | `String?` | QR payload for pickup |
| `deliveryPartner*` | various | Partner name, phone, coordinates |

Computed helpers: `isPending`, `isActive`, `isCompleted`, `canAccept`, `canGenerateInvoice`, `canGenerateQR`, `isReadyForPickup`, `statusDisplayText`, `priorityDisplayText`.

#### `OrderItemEntity` (Freezed)
| Field | Type | Description |
|---|---|---|
| `medicineName` | `String` | Name of medicine |
| `quantity` | `int` | Units requested |
| `price` | `double` | Unit price |
| `availability` | `ItemAvailability` | Stock status |
| `substituteName/Price` | `String?/double?` | Alternate medicine if unavailable |

#### `OrderActionEntity` (Freezed sealed union)
Encapsulates every possible action a pharmacist can take:
- `AcceptOrderAction(orderId, items, notes?)`
- `RejectOrderAction(orderId, reason)`
- `PartialAcceptOrderAction(orderId, availableItems, unavailableItems, notes?)`
- `GenerateInvoiceAction(orderId)`
- `GenerateQRAction(orderId)`
- `MarkReadyAction(orderId)`
- `ConfirmPickupAction(orderId, qrData)`
- `UpdateLocationAction(orderId, lat, lng)`
- `MarkDeliveredAction(orderId)`

#### `InvoiceEntity` / `InvoiceItemEntity` (Freezed)
Captures all fields needed for a GST-compliant invoice: invoice number, pharmacy GSTIN & license, customer details, itemised lines, subtotal, CGST, SGST, delivery fee, and grand total.

### Repository
`OrderRepository` abstract interface (key methods):
- `getOrders()` → `Either<String, List<OrderEntity>>`
- `updateOrderStatus(orderId, newStatus)` → `Either<String, void>`
- `acceptOrder(AcceptOrderAction)` → `Either<String, void>`
- `rejectOrder(RejectOrderAction)` → `Either<String, void>`
- `partialAcceptOrder(PartialAcceptOrderAction)` → `Either<String, void>`
- `generateInvoice(orderId)` → `Either<String, String>` (returns PDF URL)
- `generateQRCode(orderId)` → `Either<String, String>` (returns QR payload)
- `confirmPickup(orderId, qrData)` → `Either<String, void>`
- `updateDeliveryLocation(orderId, lat, lng)` → `Either<String, void>`
- `markDelivered(orderId)` → `Either<String, void>`

### Providers & State

#### `OrdersState` (Freezed union)
```
initial | loading | loaded(List<OrderEntity>) | error(String)
```

#### `Orders` notifier (`@riverpod`)
Initialises by calling `loadOrders()`. Exposes:
- `loadOrders()` – fetches full list, updates state.
- `updateOrderStatus()`, `acceptOrder()`, `rejectOrder()`, `partialAcceptOrder()`, `generateInvoice()`, `generateQRCode()`, `confirmPickup()`, `updateDeliveryLocation()`, `markDelivered()` – each delegates to repository and triggers `loadOrders()` on success.
- Filter helpers: `getPendingOrders()`, `getActiveOrders()`, `getInProgressOrders()`, `getCompletedOrders()`.

#### `NewOrderNotifier` notifier (`@riverpod`)
Holds a single `OrderEntity?`. Used to display a banner alert when a brand-new order arrives. `showNewOrder(order)` sets the state; `dismissNewOrder()` clears it.

### Screens

| Screen | Route | Description |
|---|---|---|
| `HomeScreen` | `/home` | Thin wrapper that renders `OrdersQueueScreen`. |
| `OrdersQueueScreen` | `/home` | Main dashboard. Three-tab view (All / Active / Completed), search bar, responsive grid/list, `NewOrderBanner` overlay, FAB for QR scan. |
| `OrderDetailScreen` | `/home/order/:orderId` | Full order detail with responsive layout (mobile: stacked, desktop: split prescription+details). Contains prescription viewer, medicine list, timeline, action section, and tracking link. |
| `ItemCheckerScreen` | `/home/order/:orderId/check-items` | Line-item verification. Staff marks each medicine as available/unavailable/substituted. Accept/partial-accept/reject buttons trigger repository actions. |
| `InvoiceScreen` | `/home/order/:orderId/invoice` | Renders `InvoiceEntity` visually and calls `InvoiceService` to generate + download/print a PDF. |
| `QRCodeScreen` | `/home/order/:orderId/qr-code` | Renders the order's QR payload using `qr_flutter`. Includes copy-to-clipboard and share actions. |
| `QRScannerScreen` | `/home/scan-qr` | Camera-based QR scanning (mobile) — currently routed to `ManualQRInputScreen`. |
| `ManualQRInputScreen` | `/home/scan-qr` | Text-field fallback for QR code input on platforms without camera access. |
| `DeliveryTrackingScreen` | `/home/order/:orderId/track` | Google Maps view showing delivery partner's live location (`deliveryPartnerLat/Lng`) alongside destination pin. |

### Widgets

| Widget | Description |
|---|---|
| `AppDrawer` | Side navigation. Reads `authProvider` for user info and `hasPermissionProvider` to show/hide wallet, profile, settings, and staff management links. Displays unread notification badge. |
| `OrdersHeader` | Top bar with user/pharmacy name, logout action, and search toggle. |
| `OrderCard` | Summary card for a single order in the queue. Tappable to navigate to `OrderDetailScreen`. |
| `NewOrderBanner` | Slide-in alert overlay that presents an incoming order with Accept/Reject shortcuts. |
| `OrderStatusTimeline` | Vertical timeline visualisation of `OrderStatus` steps. |
| `CustomerInfoSection` | Card displaying customer name, phone, address, and delivery distance. |
| `MedicineListSection` | List of `OrderItemEntity` rows with availability badges. |
| `PrescriptionViewer` | Displays the prescription image from URL; collapsible on mobile. |
| `OrderActionsSection` | Contextual action buttons (Accept, Reject, Generate Invoice, Generate QR, Confirm Pickup, Mark Delivered) based on current `OrderStatus`. |
| `ComplianceFooter` | Regulatory disclaimer strip shown on order detail pages. |
| `EmptyOrdersState` | Illustrated empty state keyed to the current `OrdersFilter`. |

### Data Flow
```
OrdersQueueScreen
    └── ref.watch(ordersProvider)  ──► OrdersState.loaded(orders)
    └── ref.watch(newOrderProvider) ──► OrderEntity?
              │
              ▼
        NewOrderBanner (if newOrder != null)
              ├── onAccept ──► ordersProvider.notifier.acceptOrder()
              │                   └── MockOrdersRepository.acceptOrder()
              │                           └── ordersProvider.notifier.loadOrders()
              └── onReject ──► ordersProvider.notifier.rejectOrder()

OrderDetailScreen
    └── ref.watch(ordersProvider) → find order by id
    └── OrderActionsSection
              └── onUpdateStatus(newStatus)
                      └── ordersProvider.notifier.updateOrderStatus()

ItemCheckerScreen
    └── Per-item availability toggle ──► local state
    └── Accept ──► ordersProvider.notifier.acceptOrder(items)
    └── Partial ──► ordersProvider.notifier.partialAcceptOrder(available, unavailable)
    └── Reject ──► ordersProvider.notifier.rejectOrder(reason)

InvoiceScreen
    └── ref.watch(ordersProvider) → find order
    └── InvoiceService.generatePDF(InvoiceEntity)
              └── pdf package → Uint8List
              └── printing.layoutPdf / download

QRCodeScreen
    └── order.qrCode ──► QrImageView widget (qr_flutter)

DeliveryTrackingScreen
    └── order.deliveryPartnerLat/Lng ──► GoogleMap marker
    └── ordersProvider.notifier.updateDeliveryLocation()
    └── ordersProvider.notifier.markDelivered()
```

---

## Feature 3 – Inventory Management

### What It Does
Allows the pharmacy to maintain a real-time catalogue of its medicine stock. Staff can add new medicines, adjust stock quantities, track expiry dates, and be alerted about low stock or near-expiry items.

### Entities

#### `StockStatus` (enum)
```
inStock | lowStock | outOfStock | reserved
```

#### `InventoryItemEntity` (Freezed)
| Field | Type | Description |
|---|---|---|
| `id` / `medicineId` | `String` | Internal & catalogue IDs |
| `medicineName` | `String` | Display name |
| `dosage` / `brandName` / `genericName` | `String?` | Medicine details |
| `currentStock` | `int` | Total units on shelf |
| `minStockLevel` | `int` | Reorder threshold |
| `reservedQuantity` | `int?` | Units locked for in-progress orders |
| `unitPrice` | `double` | Selling price per unit |
| `batchNumber` | `String` | Manufacturing batch |
| `expiryDate` | `DateTime` | Shelf life deadline |
| `lastRestocked` | `DateTime` | Last restocking timestamp |
| `rackLocation` | `String?` | Physical shelf identifier |
| `isChronicMedication` | `bool?` | Flags long-term condition drugs |
| `isScheduledDrug` | `bool?` | Controlled substance flag |
| `supplierName` | `String?` | Supplier reference |

Computed helpers: `stockStatus`, `availableStock` (`currentStock - reservedQuantity`), `daysUntilExpiry`, `isExpiringSoon` (≤ 60 days), `isExpired`, `needsRestock`, `stockStatusDisplayName`.

### Repository
`InventoryRepository` abstract interface:
- `getInventory()` → `Either<String, List<InventoryItemEntity>>`
- `addItem(InventoryItemEntity)` → `Either<String, void>`
- `updateItem(InventoryItemEntity)` → `Either<String, void>`
- `deleteItem(String id)` → `Either<String, void>`
- `adjustStock(String id, int newQuantity)` → `Either<String, void>`

### Provider & State

#### `InventoryState` (Freezed union)
```
initial | loading | loaded(List<InventoryItemEntity>) | error(String)
```

#### `Inventory` notifier (`@riverpod`)
- `loadInventory()` – fetches list.
- `addOrUpdateItem(item)` – delegates to `addItem` or `updateItem` depending on whether the item already exists.
- `adjustStock(id, newQuantity)` – adjusts quantity, reloads.
- `deleteItem(id)` – removes and reloads.
- Filter helpers: `getLowStockItems()`, `getExpiringSoonItems()`, `getChronicMedications()`.

### Screens & Widgets

**`InventoryScreen`** (`/home/inventory`)  
Full-screen inventory manager with:
- Searchable list (medicine name, brand, generic).
- **Filter chips:** All / Low Stock / Expiring Soon / Chronic.
- Responsive layout: list (mobile) → 2-column grid (tablet) → 3-column grid (desktop).
- FAB to add medicine (gated by `Permission.addInventory`).
- Pull-to-refresh.

| Widget | Description |
|---|---|
| `InventoryStatsCards` | Summary row: total items, low-stock count, expiring-soon count, out-of-stock count. |
| `InventoryFilterChips` | Horizontal chip row for `InventoryFilter` enum. |
| `InventoryItemCard` | Per-item card showing name, dosage, stock badge, expiry, price. Provides `onStockAdjusted` and `onDeleted` callbacks. |
| `AddInventoryDialog` | Modal form to add or edit an `InventoryItemEntity`. |
| `StockAdjustmentDialog` | Quick numeric input dialog for adjusting stock quantity. |
| `DeleteConfirmationDialog` | Confirmation prompt before deleting a medicine. |
| `EmptyInventoryState` | Empty state illustration keyed to current `InventoryFilter`. |

### Data Flow
```
InventoryScreen
    └── ref.watch(inventoryProvider) ──► InventoryState.loaded(items)
    └── InventoryFilterChips ──► local _currentFilter state
    └── _filterItems(items) ──► inventoryProvider.notifier.getLowStockItems() etc.
    └── InventoryItemCard
              ├── onStockAdjusted ──► inventoryProvider.notifier.adjustStock()
              └── onDeleted ──► inventoryProvider.notifier.deleteItem()
    └── AddInventoryDialog (FAB)
              └── returns InventoryItemEntity
                      └── inventoryProvider.notifier.addOrUpdateItem()
```

---

## Feature 4 – Wallet & Earnings

### What It Does
Presents the pharmacy's financial summary: pending balance (from orders not yet settled), available balance (withdrawable funds), total withdrawn, and lifetime earnings. Provides a transaction history and fund-withdrawal capability.

### Entities

#### `WalletEntity` (Freezed)
| Field | Type | Description |
|---|---|---|
| `pharmacyId` | `String` | Owner reference |
| `pendingBalance` | `double` | Earnings pending settlement |
| `availableBalance` | `double` | Funds available to withdraw |
| `totalWithdrawn` | `double` | Cumulative withdrawal amount |
| `lifetimeEarnings` | `double` | All-time gross |
| `totalOrders` | `int` | Orders contributing to wallet |
| `lastUpdated` | `DateTime` | Last sync timestamp |

Computed: `totalBalance = pendingBalance + availableBalance`.

#### `TransactionType` (enum)
```
orderPayment | withdrawal | refund | adjustment
```

#### `TransactionStatus` (enum)
```
pending | completed | failed | processing
```

#### `TransactionEntity` (Freezed)
| Key Fields | Type | Description |
|---|---|---|
| `id` / `orderId` / `orderNumber` | `String` | References |
| `type` | `TransactionType` | Payment, withdrawal, etc. |
| `status` | `TransactionStatus` | Processing state |
| `transactionDate` | `DateTime` | When it occurred |
| `totalAmount` | `double` | Full order value |
| `pharmacyAmount` | `double` | Pharmacy's cut |
| `deliveryFee` | `double` | Delivery partner share |
| `fulfillmentFee` | `double` | Platform commission |
| `withdrawalMethod` / `referenceNumber` | `String?` | Withdrawal metadata |

### Repository
`WalletRepository` abstract interface:
- `getWallet()` → `Either<String, WalletEntity>`
- `getTransactions()` → `Either<String, List<TransactionEntity>>`
- `withdrawFunds(double amount)` → `Either<String, void>`

### Provider & State

#### `WalletState` (Freezed union)
```
initial | loading | loaded(wallet: WalletEntity, transactions: List<TransactionEntity>) | error(String)
```

#### `Wallet` notifier (`@riverpod`)
- Calls both `getWallet()` and `getTransactions()` in sequence on build.
- `withdrawFunds(amount)` – triggers withdrawal and reloads wallet.
- `getOrderTransactions()` / `getWithdrawals()` – filter helpers.

### Screens & Widgets

**`WalletScreen`** (`/home/wallet`)  
Responsive three-layout screen (mobile / tablet / desktop). Displays balance and transaction list. Navigation action takes user to Analytics.

| Widget | Description |
|---|---|
| `WalletBalanceCard` | Hero card showing pending + available balances and total withdrawn. |
| `QuickActionsCard` | Buttons for Withdraw Funds and navigating to Analytics. |
| `EarningsBreakdownCard` | Pie/bar summary of pharmacy share vs. platform fees vs. delivery fees. |
| `TransactionList` | Filterable (All / Orders / Withdrawals) list of `TransactionEntity` rows. |
| `WithdrawDialog` | Amount-input modal; calls `walletProvider.notifier.withdrawFunds()`. |

### Data Flow
```
WalletScreen
    └── ref.watch(walletProvider) ──► WalletState.loaded(wallet, transactions)
    └── WalletBalanceCard ──► wallet.pendingBalance / availableBalance
    └── TransactionList
              └── _currentFilter ──► all | walletProvider.notifier.getOrderTransactions()
                                             | walletProvider.notifier.getWithdrawals()
    └── WithdrawDialog
              └── walletProvider.notifier.withdrawFunds(amount)
                      └── MockWalletRepository.withdrawFunds()
                              └── walletProvider.notifier.loadWallet()
```

---

## Feature 5 – Analytics

### What It Does
Provides time-range filtered analytics dashboards: earnings over time (line/bar chart), earnings by medicine category (pie chart), and key KPI summary cards. Supports CSV/data export.

### Entities

#### `DateRangeType` (enum)
```
today | yesterday | last7Days | last30Days | thisMonth | lastMonth | custom
```

#### `AnalyticsEntity` (Freezed)
| Field | Type | Description |
|---|---|---|
| `totalEarnings` / `pharmacyShare` / `deliveryFee` / `platformFee` | `double` | Financial breakdown |
| `totalOrders` / `completedOrders` / `cancelledOrders` | `int` | Order counts |
| `averageOrderValue` | `double` | Mean order value |
| `dailyEarnings` | `List<DailyEarning>` | Per-day amount + order count |
| `categoryEarnings` | `List<CategoryEarning>` | Per-category amount + percentage |
| `startDate` / `endDate` | `DateTime` | Query window |

#### `DailyEarning` (Freezed)
`date`, `amount`, `orderCount`

#### `CategoryEarning` (Freezed)
`category`, `amount`, `percentage`

### Provider & State

#### `AnalyticsState` (Freezed union)
```
initial | loading | loaded(AnalyticsEntity) | error(String)
```

#### `Analytics` notifier (`@riverpod`)
- Defaults to last 7 days on build.
- `loadAnalytics(startDate, endDate)` – fetches from repository.
- `loadByDateRange(DateRangeType)` – computes date bounds then calls `loadAnalytics`.

### Services

**`AnalyticsExportService`**  
Generates a CSV file from an `AnalyticsEntity` and uses `url_launcher` / platform download utilities to share or save it.

### Screens & Widgets

**`AnalyticsScreen`** (`/home/wallet/analytics`)  
Date-range selector at the top. Below: KPI cards row, earnings line chart (`fl_chart`), category pie chart. Export button triggers `AnalyticsExportService`.

| Widget | Description |
|---|---|
| `StatsCard` | Single KPI tile (label + value + optional delta indicator). |
| `EarningsChart` | Line/bar chart of `DailyEarning` data using `fl_chart`. |
| `CategoryChart` | Pie chart of `CategoryEarning` data using `fl_chart`. |

### Data Flow
```
AnalyticsScreen
    └── DateRange selector ──► analyticsProvider.notifier.loadByDateRange(type)
                                      └── MockAnalyticsRepository.getAnalytics(start, end)
                                              └── analyticsProvider state = AnalyticsState.loaded(analytics)
    └── ref.watch(analyticsProvider) ──► AnalyticsState.loaded(analytics)
              ├── StatsCard (totalEarnings, completedOrders, etc.)
              ├── EarningsChart (analytics.dailyEarnings)
              └── CategoryChart (analytics.categoryEarnings)
    └── Export button ──► AnalyticsExportService.export(analytics)
```

---

## Feature 6 – Notifications

### What It Does
Aggregates system-generated alerts (new orders, low stock, expiring medicines, payment confirmations, system messages) in a chronological feed with read/unread state and action routing.

### Entities

#### `NotificationType` (enum)
```
newOrder | lowStock | expiringMedicine | orderUpdate | paymentReceived | systemAlert
```

#### `NotificationPriority` (enum)
```
low | medium | high | critical
```

#### `NotificationEntity` (Freezed)
| Field | Type | Description |
|---|---|---|
| `id` | `String` | Unique identifier |
| `type` | `NotificationType` | Category for icon/colour |
| `priority` | `NotificationPriority` | Visual prominence |
| `title` / `message` | `String` | Display copy |
| `timestamp` | `DateTime` | Arrival time |
| `isRead` | `bool` | Read state |
| `actionRoute` | `String?` | GoRouter path to navigate on tap |
| `actionData` | `Map<String, dynamic>?` | Route parameters |
| `imageUrl` | `String?` | Optional inline image |

### Provider & State

#### `NotificationState` (Freezed union)
```
initial | loading | loaded(List<NotificationEntity>) | error(String)
```

#### `Notifications` notifier (`@riverpod`)
- `loadNotifications()` – fetches list.
- `markAsRead(id)` / `markAllAsRead()` – update read state and reload.
- `deleteNotification(id)` – removes and reloads.
- `getUnreadCount()` – synchronous call to repository for badge count.

### Screens & Widgets

**`NotificationsScreen`** (`/home/notifications`)  
Lists notifications in reverse-chronological order. Toggle to show unread only. Overflow menu for "Mark all as read". Tapping a notification with an `actionRoute` navigates to the relevant screen. Priority `critical` notifications are visually distinct (coloured left border, bold text).

### Data Flow
```
AppDrawer
    └── notificationsProvider.notifier.getUnreadCount() ──► badge number on drawer item

NotificationsScreen
    └── ref.watch(notificationsProvider) ──► NotificationState.loaded(notifications)
    └── _showUnreadOnly toggle ──► local filter applied to loaded list
    └── NotificationTile tap
              └── actionRoute != null ──► context.go(actionRoute, extra: actionData)
    └── markAsRead(id) / deleteNotification(id)
              └── MockNotificationRepository mutation
                      └── loadNotifications() ──► state refreshed
```

---

## Feature 7 – Profile

### What It Does
Displays and allows editing of the pharmacy's full operational profile: contact details, address, drug licence information, pharmacist registration, and bank/UPI details for payouts.

### Entities

#### `ProfileEntity` (Freezed)
| Field | Type | Notes |
|---|---|---|
| `pharmacyName` / `ownerName` | `String` | Core identity |
| `email` / `phone` / `alternatePhone?` | `String` | Contact |
| `address` / `city` / `state` / `pincode` | `String` | Location |
| `licenseNumber` / `licenseExpiry` | `String / DateTime` | Regulatory |
| `gstin` | `String` | GST identification |
| `pharmacistName` / `pharmacistRegNumber` | `String` | Professional credentials |
| `logoUrl?` | `String?` | Pharmacy logo |
| `bankName?` / `accountNumber?` / `ifscCode?` / `upiId?` | `String?` | Payout details |
| `isVerified?` / `isActive?` | `bool?` | Platform status |

### Provider & State

#### `ProfileState` (Freezed union)
```
initial | loading | loaded(ProfileEntity) | error(String)
```

#### `Profile` notifier (`@riverpod`)
- `loadProfile()` – fetches profile.
- `updateProfile(ProfileEntity)` – persists changes and reloads.

### Screens & Widgets

**`ProfileScreen`** (`/home/profile`)  
Read-only card-based view. FAB to open `EditProfileDialog` (gated by `Permission.editProfile`). Avatar supports camera/gallery image picker (gated by same permission). Bank details account number is masked.

| Widget | Description |
|---|---|
| Profile header card | Gradient card with avatar, pharmacy name, verified badge. |
| Section cards | Pharmacy Details, Address, License Information, Bank Details — each rendered as a labelled row list. |
| `EditProfileDialog` | Full-field edit form returned as `ProfileEntity?`. |

### Data Flow
```
ProfileScreen
    └── ref.watch(profileProvider) ──► ProfileState.loaded(profile)
    └── FAB (hasPermission(editProfile))
              └── EditProfileDialog ──► returns ProfileEntity
                      └── profileProvider.notifier.updateProfile(profile)
    └── Avatar camera icon (hasPermission(editProfile))
              └── ImagePicker.pickImage() ──► TODO: real upload; currently placeholder URL
                      └── profileProvider.notifier.updateProfile(profile.copyWith(logoUrl: ...))
```

---

## Feature 8 – Settings

### What It Does
App-level configuration: theme (light/dark/system), language, notification toggles (per type), sound/vibration, auto-accept orders toggle, and delivery radius. Theme changes take effect immediately across the entire app.

### Entities

#### `ThemeMode` (enum)
```
light | dark | system
```

#### `Language` (enum)
```
english | hindi | bengali
```

#### `SettingsEntity` (Freezed)
| Field | Type | Default |
|---|---|---|
| `themeMode` | `ThemeMode` | `system` |
| `language` | `Language` | `english` |
| `notificationsEnabled` | `bool` | `true` |
| `orderAlertsEnabled` | `bool` | `true` |
| `lowStockAlertsEnabled` | `bool` | `true` |
| `expiryAlertsEnabled` | `bool` | `true` |
| `soundEnabled` | `bool` | `true` |
| `vibrationEnabled` | `bool` | `true` |
| `autoAcceptOrders` | `bool` | `false` |
| `orderRadius` | `double` | km radius for accepting orders |

### Provider & State

#### `SettingsState` (Freezed union)
```
initial | loading | loaded(SettingsEntity) | error(String)
```

#### `Settings` notifier (`@riverpod`)
- `loadSettings()` – fetches from mock repository.
- `updateSettings(SettingsEntity)` – persists and updates state.
- `toggleTheme()`, `updateOrderRadius(double)` convenience helpers.

### Screens

**`SettingsScreen`** (`/home/settings`)  
Sectioned list: Appearance, Notifications, Orders, About. Theme toggle immediately updates `MaterialApp.router`'s `themeMode` because `main.dart` watches `settingsProvider` directly.

**`ChangePasswordScreen`** (`/change-password`)  
Accessible from Settings. Calls `authProvider.notifier.changePassword()`.

### Data Flow (Theme)
```
SettingsScreen
    └── ThemeMode toggle ──► settingsProvider.notifier.updateSettings(...)
                                    └── SettingsState.loaded(newSettings)
                                            └── observed in main.dart
                                                    └── AltheaCarePharmacyApp.build()
                                                            └── themeMode switch
                                                                    └── MaterialApp.router(themeMode: ...)
```

---

## Feature 9 – Staff Management

### What It Does
Admin-only feature. Allows the pharmacy owner (admin role) to invite staff members, assign roles, manage per-permission grants, deactivate/reactivate accounts, and reset staff details.

### Entities

#### `StaffEntity` (Freezed)
| Field | Type | Description |
|---|---|---|
| `id` / `pharmacyId` | `String` | Identifiers |
| `name` / `email` / `phoneNumber?` | `String` | Contact |
| `role` | `RoleEntity` | Embedded role with permissions |
| `photoUrl?` | `String?` | Avatar |
| `createdAt` | `DateTime` | Account creation |
| `lastLoginAt?` | `DateTime?` | Last activity |
| `isActive` | `bool` | Active/deactivated flag (default: true) |

### Repository
`StaffRepository` abstract interface:
- `getAllStaff(pharmacyId)` → `Either<String, List<StaffEntity>>`
- `addStaff(name, email, password, pharmacyId, role, ...)` → `Either<String, StaffEntity>`
- `updateStaff(id, ...)` → `Either<String, void>`
- `updateStaffPermissions(id, role)` → `Either<String, void>`
- `deleteStaff(id)` → `Either<String, void>`
- `reactivateStaff(id)` → `Either<String, void>`

### Provider & State

#### `StaffState` (Freezed union)
```
initial | loading | loaded(List<StaffEntity>) | error(String)
```

#### `StaffManagement` notifier (`@riverpod`)
- `loadStaff(pharmacyId)` – fetches full staff list.
- `addStaff(...)`, `updateStaff(...)`, `updateStaffPermissions(...)`, `deleteStaff(...)`, `reactivateStaff(...)` – delegate to repository then reload.

### Screens & Widgets

**`StaffManagementScreen`** (`/home/staff-management`)  
Accessible only to users with `Permission.manageUsers`; otherwise shows a permission-denied state. Shows searchable list of active/inactive staff. Toggle to show deactivated accounts.

| Widget | Description |
|---|---|
| `AddStaffDialog` | Form to create a new staff account (name, email, password, role selector). |
| `EditStaffDialog` | Edit existing staff details (name, phone, active status). |
| `StaffPermissionsDialog` | Granular permission editor: shows all `Permission` enum values as toggles, builds a custom `RoleEntity`. |

### Data Flow
```
StaffManagementScreen
    └── initState ──► staffManagementProvider.notifier.loadStaff(pharmacyId)
    └── ref.watch(staffManagementProvider) ──► StaffState.loaded(staffList)
    └── FAB (hasPermission(manageUsers))
              └── AddStaffDialog ──► staffManagementProvider.notifier.addStaff(...)
    └── StaffCard edit icon
              └── EditStaffDialog ──► staffManagementProvider.notifier.updateStaff(...)
    └── Permissions icon
              └── StaffPermissionsDialog
                      └── custom RoleEntity
                              └── staffManagementProvider.notifier.updateStaffPermissions(id, role)
```

---

## Feature 10 – Legal / About

### What It Does
Provides static and dynamically loaded legal and informational content required for regulatory compliance and transparency.

### Screens

| Screen | Route | Description |
|---|---|---|
| `WebViewScreen` | `/home/terms`, `/home/privacy` | Embeds `webview_flutter` to load hosted Terms & Conditions and Privacy Policy URLs (from `AppUrls`). |
| `FAQScreen` | `/home/faq` | Locally rendered expandable FAQ list. |
| `AboutScreen` | `/home/about` | App version (via `package_info_plus`), pharmacy partner information, and AltheaCare branding. |
| `LegalContentScreen` | (standalone) | Generic content renderer for other legal text. |

---

## Cross-Feature Data Flow Summary

```
App Start
    └── main.dart: Hive.initFlutter()
    └── ProviderScope wraps AltheaCarePharmacyApp
    └── AltheaCarePharmacyApp
            ├── ref.watch(appRouterProvider)   ──► GoRouter
            └── ref.watch(settingsProvider)    ──► ThemeMode

    GoRouter initialLocation: /splash
    └── SplashScreen
            └── ref.listen(authProvider)
                    ├── user != null ──► /home ──► OrdersQueueScreen
                    └── user == null ──► /login ──► LoginScreen

OrdersQueueScreen (Hub)
    ├── ref.watch(ordersProvider)          ──► order list
    ├── ref.watch(newOrderProvider)        ──► new order banner
    ├── ref.watch(authProvider)            ──► user name / pharmacy name
    └── AppDrawer
            ├── ref.watch(authProvider)                     ──► user info
            ├── ref.watch(currentUserRoleProvider)          ──► role badge
            ├── ref.watch(hasPermissionProvider(viewWallet)) ──► show/hide Wallet
            ├── ref.watch(hasPermissionProvider(manageUsers)) ──► show/hide Staff
            └── notificationsProvider.notifier.getUnreadCount() ──► badge

Order lifecycle (status transitions):
    pending ──[ItemCheckerScreen accept]──► accepted
    accepted ──[InvoiceScreen generate]──► preparingInvoice
    preparingInvoice ──[QRCodeScreen generate]──► readyForPickup
    readyForPickup ──[ManualQRInputScreen scan]──► pickedUp / outForDelivery
    outForDelivery ──[DeliveryTrackingScreen markDelivered]──► delivered

Wallet ←── completed orders ──► Analytics
    WalletScreen
        └── child route: /home/wallet/analytics ──► AnalyticsScreen

Inventory ←─────────────────── OrderItemEntity.availability
    (availability check in ItemCheckerScreen informs pharmacist
     but does not automatically mutate inventory; stock adjustment
     is done manually in InventoryScreen)
```

---

## Navigation Map

```
/splash
/login
/forgot-password
/change-password
/home                          ← OrdersQueueScreen
/home/order/:orderId           ← OrderDetailScreen
/home/order/:orderId/check-items ← ItemCheckerScreen
/home/order/:orderId/invoice   ← InvoiceScreen
/home/order/:orderId/qr-code   ← QRCodeScreen
/home/order/:orderId/track     ← DeliveryTrackingScreen
/home/scan-qr                  ← ManualQRInputScreen (or QRScannerScreen)
/home/inventory                ← InventoryScreen
/home/wallet                   ← WalletScreen
/home/wallet/analytics         ← AnalyticsScreen
/home/notifications            ← NotificationsScreen
/home/profile                  ← ProfileScreen
/home/settings                 ← SettingsScreen
/home/staff-management         ← StaffManagementScreen
/home/terms                    ← WebViewScreen (Terms)
/home/privacy                  ← WebViewScreen (Privacy)
/home/faq                      ← FAQScreen
/home/about                    ← AboutScreen
```

---

## Key Libraries & Their Roles

| Library | Version | Role |
|---|---|---|
| `flutter_riverpod` + `riverpod_annotation` | ^3.0.x | State management and dependency injection |
| `freezed` + `freezed_annotation` | ^3.x | Immutable value objects and sealed unions |
| `go_router` + `go_router_builder` | ^17.x | Declarative URL-based routing |
| `hive` + `hive_flutter` | ^2.x | Local key-value offline storage |
| `shared_preferences` | ^2.5 | Session token persistence |
| `fl_chart` | ^1.1 | Earnings and category charts |
| `qr_flutter` | ^4.1 | QR code display |
| `mobile_scanner` | ^5.2 | Camera-based QR scanning (mobile) |
| `pdf` + `printing` | ^3.11 / ^5.14 | Invoice PDF generation and printing |
| `google_maps_flutter` | ^2.14 | Delivery tracking map |
| `geolocator` + `geocoding` | ^14 / ^4 | GPS-based location services |
| `image_picker` | ^1.1 | Camera/gallery photo picker for profile |
| `signature` | ^5.5 | Signature capture (future use) |
| `webview_flutter` | ^4.13 | Embedded web content (T&C, Privacy) |
| `url_launcher` | ^6.3 | Open external URLs |
| `google_fonts` | ^7.0 | Typography |
| `flutter_animate` | ^4.5 | UI animations |
| `shimmer` | ^3.0 | Loading skeleton placeholders |
| `intl` | ^0.19 | Date/number formatting |
| `dartz` | ^0.10 | `Either` type for functional error handling |
| `package_info_plus` | ^8.1 | App version info |
| `uuid` | ^4.5 | UUID generation |
