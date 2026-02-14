// ignore_for_file: unnecessary_string_interpolations

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/order_entity.dart';
import '../providers/orders_provider.dart';
import '../providers/orders_state.dart';

class DeliveryTrackingScreen extends ConsumerStatefulWidget {
  final String orderId;

  const DeliveryTrackingScreen({super.key, required this.orderId});

  @override
  ConsumerState<DeliveryTrackingScreen> createState() =>
      _DeliveryTrackingScreenState();
}

class _DeliveryTrackingScreenState
    extends ConsumerState<DeliveryTrackingScreen> {
  GoogleMapController? _mapController;
  OrderEntity? _order;
  Timer? _locationTimer;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  bool _isMapReady = false;

  // Mock coordinates for demo (Kolkata area)
  final LatLng _pharmacyLocation = const LatLng(22.5726, 88.3639);
  LatLng? _deliveryLocation;
  LatLng? _customerLocation;

  @override
  void initState() {
    super.initState();
    _loadOrder();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    _locationTimer?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  void _loadOrder() {
    final ordersState = ref.read(ordersProvider);
    ordersState.maybeWhen(
      loaded: (orders) {
        final order = orders.firstWhere((o) => o.id == widget.orderId);
        setState(() {
          _order = order;
          _customerLocation = LatLng(
            22.5826,
            88.3739,
          ); // Mock customer location
          _deliveryLocation =
              order.deliveryPartnerLat != null &&
                  order.deliveryPartnerLng != null
              ? LatLng(order.deliveryPartnerLat!, order.deliveryPartnerLng!)
              : _pharmacyLocation;
          _updateMarkers();
          _updatePolyline();
        });
      },
      orElse: () {},
    );
  }

  void _startLocationUpdates() {
    // Simulate delivery partner movement every 5 seconds
    _locationTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_order != null &&
          _deliveryLocation != null &&
          _customerLocation != null) {
        // Move delivery partner closer to customer (mock movement)
        setState(() {
          final currentLat = _deliveryLocation!.latitude;
          final currentLng = _deliveryLocation!.longitude;
          final targetLat = _customerLocation!.latitude;
          final targetLng = _customerLocation!.longitude;

          // Move 10% closer each update
          final newLat = currentLat + (targetLat - currentLat) * 0.1;
          final newLng = currentLng + (targetLng - currentLng) * 0.1;

          _deliveryLocation = LatLng(newLat, newLng);
          _updateMarkers();
          _updatePolyline();

          // Update camera position
          if (_mapController != null) {
            _mapController!.animateCamera(
              CameraUpdate.newLatLng(_deliveryLocation!),
            );
          }

          // Update in provider (in real app, this would come from backend)
          ref
              .read(ordersProvider.notifier)
              .updateDeliveryLocation(widget.orderId, newLat, newLng);

          // Check if reached destination
          final distance = _calculateDistance(
            _deliveryLocation!,
            _customerLocation!,
          );
          if (distance < 0.1) {
            // Less than 100m
            _showArrivalDialog();
            timer.cancel();
          }
        });
      }
    });
  }

  void _updateMarkers() {
    _markers = {
      // Pharmacy marker
      Marker(
        markerId: const MarkerId('pharmacy'),
        position: _pharmacyLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(
          title: '🏥 Pharmacy',
          snippet: 'Order pickup location',
        ),
      ),
      // Delivery partner marker
      if (_deliveryLocation != null)
        Marker(
          markerId: const MarkerId('delivery'),
          position: _deliveryLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          infoWindow: InfoWindow(
            title: '🚴 ${_order?.deliveryPartnerName ?? "Delivery Partner"}',
            snippet: 'On the way',
          ),
        ),
      // Customer marker
      if (_customerLocation != null)
        Marker(
          markerId: const MarkerId('customer'),
          position: _customerLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: InfoWindow(
            title: '📍 ${_order?.customerName ?? "Customer"}',
            snippet: 'Delivery destination',
          ),
        ),
    };
  }

  void _updatePolyline() {
    if (_deliveryLocation != null && _customerLocation != null) {
      _polylines = {
        Polyline(
          polylineId: const PolylineId('route'),
          points: [_deliveryLocation!, _customerLocation!],
          color: AppColors.primaryDark,
          width: 5,
          patterns: [PatternItem.dash(20), PatternItem.gap(10)],
        ),
      };
    }
  }

  double _calculateDistance(LatLng point1, LatLng point2) {
    // Simple Euclidean distance (in real app use proper geo calculation)
    final latDiff = point1.latitude - point2.latitude;
    final lngDiff = point1.longitude - point2.longitude;
    return (latDiff * latDiff + lngDiff * lngDiff) * 111; // Rough km conversion
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_order == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _deliveryLocation ?? _pharmacyLocation,
              zoom: 14,
            ),
            markers: _markers,
            polylines: _polylines,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            onMapCreated: (controller) {
              _mapController = controller;
              setState(() => _isMapReady = true);
            },
          ),

          // Top Bar
          Positioned(top: 0, left: 0, right: 0, child: _buildTopBar(isDark)),

          // Draggable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.1,
            maxChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return _buildBottomSheet(_order!, isDark, scrollController);
            },
          ),

          // Floating Action Buttons
          Positioned(right: 16, bottom: 120, child: _buildFABs()),
        ],
      ),
    );
  }

  Widget _buildTopBar(bool isDark) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient.withOpacity(1),
          // LinearGradient(
          //   colors: [Color(0xFF6EE7B7), Color(0xFF3B82F6)], // Mint to soft blue
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDark.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => GoRouterHelper(context).pop(),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tracking Delivery',
                    style: AppTypography.titleMedium(Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _order?.orderId ?? '',
                    style: AppTypography.bodySmall(
                      Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text('Live', style: AppTypography.labelSmall(Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(OrderEntity order, bool isDark, ScrollController scrollController) {
    final distance = _deliveryLocation != null && _customerLocation != null
        ? _calculateDistance(_deliveryLocation!, _customerLocation!)
        : 0.0;
    final eta = (distance / 20 * 60).toInt(); // Mock ETA (assuming 20 km/h)

    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ListView(
        controller: scrollController,
        padding: EdgeInsets.zero,
        children: [
          // Handle
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ETA Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: AppColors.successGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estimated Arrival',
                              style: AppTypography.bodySmall(
                                Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$eta mins',
                              style: AppTypography.headlineSmall(Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${distance.toStringAsFixed(1)}',
                              style: AppTypography.titleLarge(Colors.white),
                            ),
                            Text(
                              'km',
                              style: AppTypography.caption(
                                Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Delivery Partner Info
                Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.deliveryPartnerName ?? 'Delivery Partner',
                            style: AppTypography.titleMedium(
                              isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Delivery Partner',
                            style: AppTypography.bodySmall(
                              isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      color: AppColors.primaryDark,
                      onPressed: () {
                        //TODO: Implement call functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Calling ${order.deliveryPartnerPhone ?? ""}...',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Customer Info
                _buildInfoRow(
                  Icons.person_outline,
                  'Delivering to',
                  order.customerName,
                  isDark,
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  Icons.location_on_outlined,
                  'Address',
                  order.deliveryAddress,
                  isDark,
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  Icons.medication,
                  'Items',
                  '${order.items.length} medicines',
                  isDark,
                ),

                const SizedBox(height: 20),

                // Mark as Delivered Button (for demo)
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () => _showDeliveryConfirmation(),
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Mark as Delivered'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFABs() {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: 'center',
          onPressed: _centerMap,
          backgroundColor: Colors.white,
          child: const Icon(Icons.my_location, color: AppColors.primaryDark),
        ),
        const SizedBox(height: 12),
        FloatingActionButton(
          heroTag: 'zoom',
          onPressed: _zoomToFit,
          backgroundColor: Colors.white,
          child: const Icon(Icons.zoom_out_map, color: AppColors.primaryDark),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _centerMap() {
    if (_mapController != null && _deliveryLocation != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(_deliveryLocation!, 15),
      );
    }
  }

  void _zoomToFit() {
    if (_mapController != null &&
        _deliveryLocation != null &&
        _customerLocation != null) {
      final bounds = LatLngBounds(
        southwest: LatLng(
          _deliveryLocation!.latitude < _customerLocation!.latitude
              ? _deliveryLocation!.latitude
              : _customerLocation!.latitude,
          _deliveryLocation!.longitude < _customerLocation!.longitude
              ? _deliveryLocation!.longitude
              : _customerLocation!.longitude,
        ),
        northeast: LatLng(
          _deliveryLocation!.latitude > _customerLocation!.latitude
              ? _deliveryLocation!.latitude
              : _customerLocation!.latitude,
          _deliveryLocation!.longitude > _customerLocation!.longitude
              ? _deliveryLocation!.longitude
              : _customerLocation!.longitude,
        ),
      );
      _mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
    }
  }

  void _showArrivalDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.place, color: AppColors.success, size: 64),
            const SizedBox(height: 16),
            Text(
              'Arrived!',
              style: AppTypography.headlineSmall(AppColors.success),
            ),
            const SizedBox(height: 8),
            Text(
              'Delivery partner has reached the destination',
              style: AppTypography.bodyMedium(
                Theme.of(context).textTheme.bodyMedium!.color!,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showDeliveryConfirmation();
            },
            child: const Text('Confirm Delivery'),
          ),
        ],
      ),
    );
  }

  void _showDeliveryConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delivery'),
        content: const Text(
          'Mark this order as delivered? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await ref
                  .read(ordersProvider.notifier)
                  .markDelivered(widget.orderId);

              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('✅ Order delivered successfully!'),
                    backgroundColor: AppColors.success,
                  ),
                );
                context.go('/home');
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
