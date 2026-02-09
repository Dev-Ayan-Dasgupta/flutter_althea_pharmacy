// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderEntity {

 String get id; String get orderId; String get customerName; String get customerPhone; String get deliveryAddress; double get distance; DateTime get orderTime; OrderStatus get status; OrderPriority get priority; List<OrderItemEntity> get items; double get totalAmount; String? get prescriptionUrl; String? get notes; String? get rejectionReason; String? get invoiceUrl; String? get qrCode; String? get deliveryPartnerId; String? get deliveryPartnerName; String? get deliveryPartnerPhone; double? get deliveryPartnerLat; double? get deliveryPartnerLng; DateTime? get acceptedAt; DateTime? get readyAt; DateTime? get pickedUpAt; DateTime? get deliveredAt;
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<OrderEntity> get copyWith => _$OrderEntityCopyWithImpl<OrderEntity>(this as OrderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.orderTime, orderTime) || other.orderTime == orderTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.prescriptionUrl, prescriptionUrl) || other.prescriptionUrl == prescriptionUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl)&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.deliveryPartnerId, deliveryPartnerId) || other.deliveryPartnerId == deliveryPartnerId)&&(identical(other.deliveryPartnerName, deliveryPartnerName) || other.deliveryPartnerName == deliveryPartnerName)&&(identical(other.deliveryPartnerPhone, deliveryPartnerPhone) || other.deliveryPartnerPhone == deliveryPartnerPhone)&&(identical(other.deliveryPartnerLat, deliveryPartnerLat) || other.deliveryPartnerLat == deliveryPartnerLat)&&(identical(other.deliveryPartnerLng, deliveryPartnerLng) || other.deliveryPartnerLng == deliveryPartnerLng)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.readyAt, readyAt) || other.readyAt == readyAt)&&(identical(other.pickedUpAt, pickedUpAt) || other.pickedUpAt == pickedUpAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,customerName,customerPhone,deliveryAddress,distance,orderTime,status,priority,const DeepCollectionEquality().hash(items),totalAmount,prescriptionUrl,notes,rejectionReason,invoiceUrl,qrCode,deliveryPartnerId,deliveryPartnerName,deliveryPartnerPhone,deliveryPartnerLat,deliveryPartnerLng,acceptedAt,readyAt,pickedUpAt,deliveredAt]);

@override
String toString() {
  return 'OrderEntity(id: $id, orderId: $orderId, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, distance: $distance, orderTime: $orderTime, status: $status, priority: $priority, items: $items, totalAmount: $totalAmount, prescriptionUrl: $prescriptionUrl, notes: $notes, rejectionReason: $rejectionReason, invoiceUrl: $invoiceUrl, qrCode: $qrCode, deliveryPartnerId: $deliveryPartnerId, deliveryPartnerName: $deliveryPartnerName, deliveryPartnerPhone: $deliveryPartnerPhone, deliveryPartnerLat: $deliveryPartnerLat, deliveryPartnerLng: $deliveryPartnerLng, acceptedAt: $acceptedAt, readyAt: $readyAt, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt)';
}


}

/// @nodoc
abstract mixin class $OrderEntityCopyWith<$Res>  {
  factory $OrderEntityCopyWith(OrderEntity value, $Res Function(OrderEntity) _then) = _$OrderEntityCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String customerName, String customerPhone, String deliveryAddress, double distance, DateTime orderTime, OrderStatus status, OrderPriority priority, List<OrderItemEntity> items, double totalAmount, String? prescriptionUrl, String? notes, String? rejectionReason, String? invoiceUrl, String? qrCode, String? deliveryPartnerId, String? deliveryPartnerName, String? deliveryPartnerPhone, double? deliveryPartnerLat, double? deliveryPartnerLng, DateTime? acceptedAt, DateTime? readyAt, DateTime? pickedUpAt, DateTime? deliveredAt
});




}
/// @nodoc
class _$OrderEntityCopyWithImpl<$Res>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._self, this._then);

  final OrderEntity _self;
  final $Res Function(OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? customerName = null,Object? customerPhone = null,Object? deliveryAddress = null,Object? distance = null,Object? orderTime = null,Object? status = null,Object? priority = null,Object? items = null,Object? totalAmount = null,Object? prescriptionUrl = freezed,Object? notes = freezed,Object? rejectionReason = freezed,Object? invoiceUrl = freezed,Object? qrCode = freezed,Object? deliveryPartnerId = freezed,Object? deliveryPartnerName = freezed,Object? deliveryPartnerPhone = freezed,Object? deliveryPartnerLat = freezed,Object? deliveryPartnerLng = freezed,Object? acceptedAt = freezed,Object? readyAt = freezed,Object? pickedUpAt = freezed,Object? deliveredAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,deliveryAddress: null == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,orderTime: null == orderTime ? _self.orderTime : orderTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as OrderPriority,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,prescriptionUrl: freezed == prescriptionUrl ? _self.prescriptionUrl : prescriptionUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,invoiceUrl: freezed == invoiceUrl ? _self.invoiceUrl : invoiceUrl // ignore: cast_nullable_to_non_nullable
as String?,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as String?,deliveryPartnerId: freezed == deliveryPartnerId ? _self.deliveryPartnerId : deliveryPartnerId // ignore: cast_nullable_to_non_nullable
as String?,deliveryPartnerName: freezed == deliveryPartnerName ? _self.deliveryPartnerName : deliveryPartnerName // ignore: cast_nullable_to_non_nullable
as String?,deliveryPartnerPhone: freezed == deliveryPartnerPhone ? _self.deliveryPartnerPhone : deliveryPartnerPhone // ignore: cast_nullable_to_non_nullable
as String?,deliveryPartnerLat: freezed == deliveryPartnerLat ? _self.deliveryPartnerLat : deliveryPartnerLat // ignore: cast_nullable_to_non_nullable
as double?,deliveryPartnerLng: freezed == deliveryPartnerLng ? _self.deliveryPartnerLng : deliveryPartnerLng // ignore: cast_nullable_to_non_nullable
as double?,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readyAt: freezed == readyAt ? _self.readyAt : readyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pickedUpAt: freezed == pickedUpAt ? _self.pickedUpAt : pickedUpAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderEntity].
extension OrderEntityPatterns on OrderEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String customerName,  String customerPhone,  String deliveryAddress,  double distance,  DateTime orderTime,  OrderStatus status,  OrderPriority priority,  List<OrderItemEntity> items,  double totalAmount,  String? prescriptionUrl,  String? notes,  String? rejectionReason,  String? invoiceUrl,  String? qrCode,  String? deliveryPartnerId,  String? deliveryPartnerName,  String? deliveryPartnerPhone,  double? deliveryPartnerLat,  double? deliveryPartnerLng,  DateTime? acceptedAt,  DateTime? readyAt,  DateTime? pickedUpAt,  DateTime? deliveredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.orderId,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.distance,_that.orderTime,_that.status,_that.priority,_that.items,_that.totalAmount,_that.prescriptionUrl,_that.notes,_that.rejectionReason,_that.invoiceUrl,_that.qrCode,_that.deliveryPartnerId,_that.deliveryPartnerName,_that.deliveryPartnerPhone,_that.deliveryPartnerLat,_that.deliveryPartnerLng,_that.acceptedAt,_that.readyAt,_that.pickedUpAt,_that.deliveredAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String customerName,  String customerPhone,  String deliveryAddress,  double distance,  DateTime orderTime,  OrderStatus status,  OrderPriority priority,  List<OrderItemEntity> items,  double totalAmount,  String? prescriptionUrl,  String? notes,  String? rejectionReason,  String? invoiceUrl,  String? qrCode,  String? deliveryPartnerId,  String? deliveryPartnerName,  String? deliveryPartnerPhone,  double? deliveryPartnerLat,  double? deliveryPartnerLng,  DateTime? acceptedAt,  DateTime? readyAt,  DateTime? pickedUpAt,  DateTime? deliveredAt)  $default,) {final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that.id,_that.orderId,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.distance,_that.orderTime,_that.status,_that.priority,_that.items,_that.totalAmount,_that.prescriptionUrl,_that.notes,_that.rejectionReason,_that.invoiceUrl,_that.qrCode,_that.deliveryPartnerId,_that.deliveryPartnerName,_that.deliveryPartnerPhone,_that.deliveryPartnerLat,_that.deliveryPartnerLng,_that.acceptedAt,_that.readyAt,_that.pickedUpAt,_that.deliveredAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String customerName,  String customerPhone,  String deliveryAddress,  double distance,  DateTime orderTime,  OrderStatus status,  OrderPriority priority,  List<OrderItemEntity> items,  double totalAmount,  String? prescriptionUrl,  String? notes,  String? rejectionReason,  String? invoiceUrl,  String? qrCode,  String? deliveryPartnerId,  String? deliveryPartnerName,  String? deliveryPartnerPhone,  double? deliveryPartnerLat,  double? deliveryPartnerLng,  DateTime? acceptedAt,  DateTime? readyAt,  DateTime? pickedUpAt,  DateTime? deliveredAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.orderId,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.distance,_that.orderTime,_that.status,_that.priority,_that.items,_that.totalAmount,_that.prescriptionUrl,_that.notes,_that.rejectionReason,_that.invoiceUrl,_that.qrCode,_that.deliveryPartnerId,_that.deliveryPartnerName,_that.deliveryPartnerPhone,_that.deliveryPartnerLat,_that.deliveryPartnerLng,_that.acceptedAt,_that.readyAt,_that.pickedUpAt,_that.deliveredAt);case _:
  return null;

}
}

}

/// @nodoc


class _OrderEntity extends OrderEntity {
  const _OrderEntity({required this.id, required this.orderId, required this.customerName, required this.customerPhone, required this.deliveryAddress, required this.distance, required this.orderTime, required this.status, required this.priority, required final  List<OrderItemEntity> items, required this.totalAmount, this.prescriptionUrl, this.notes, this.rejectionReason, this.invoiceUrl, this.qrCode, this.deliveryPartnerId, this.deliveryPartnerName, this.deliveryPartnerPhone, this.deliveryPartnerLat, this.deliveryPartnerLng, this.acceptedAt, this.readyAt, this.pickedUpAt, this.deliveredAt}): _items = items,super._();
  

@override final  String id;
@override final  String orderId;
@override final  String customerName;
@override final  String customerPhone;
@override final  String deliveryAddress;
@override final  double distance;
@override final  DateTime orderTime;
@override final  OrderStatus status;
@override final  OrderPriority priority;
 final  List<OrderItemEntity> _items;
@override List<OrderItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double totalAmount;
@override final  String? prescriptionUrl;
@override final  String? notes;
@override final  String? rejectionReason;
@override final  String? invoiceUrl;
@override final  String? qrCode;
@override final  String? deliveryPartnerId;
@override final  String? deliveryPartnerName;
@override final  String? deliveryPartnerPhone;
@override final  double? deliveryPartnerLat;
@override final  double? deliveryPartnerLng;
@override final  DateTime? acceptedAt;
@override final  DateTime? readyAt;
@override final  DateTime? pickedUpAt;
@override final  DateTime? deliveredAt;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderEntityCopyWith<_OrderEntity> get copyWith => __$OrderEntityCopyWithImpl<_OrderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.orderTime, orderTime) || other.orderTime == orderTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.prescriptionUrl, prescriptionUrl) || other.prescriptionUrl == prescriptionUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.invoiceUrl, invoiceUrl) || other.invoiceUrl == invoiceUrl)&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.deliveryPartnerId, deliveryPartnerId) || other.deliveryPartnerId == deliveryPartnerId)&&(identical(other.deliveryPartnerName, deliveryPartnerName) || other.deliveryPartnerName == deliveryPartnerName)&&(identical(other.deliveryPartnerPhone, deliveryPartnerPhone) || other.deliveryPartnerPhone == deliveryPartnerPhone)&&(identical(other.deliveryPartnerLat, deliveryPartnerLat) || other.deliveryPartnerLat == deliveryPartnerLat)&&(identical(other.deliveryPartnerLng, deliveryPartnerLng) || other.deliveryPartnerLng == deliveryPartnerLng)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.readyAt, readyAt) || other.readyAt == readyAt)&&(identical(other.pickedUpAt, pickedUpAt) || other.pickedUpAt == pickedUpAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,orderId,customerName,customerPhone,deliveryAddress,distance,orderTime,status,priority,const DeepCollectionEquality().hash(_items),totalAmount,prescriptionUrl,notes,rejectionReason,invoiceUrl,qrCode,deliveryPartnerId,deliveryPartnerName,deliveryPartnerPhone,deliveryPartnerLat,deliveryPartnerLng,acceptedAt,readyAt,pickedUpAt,deliveredAt]);

@override
String toString() {
  return 'OrderEntity(id: $id, orderId: $orderId, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, distance: $distance, orderTime: $orderTime, status: $status, priority: $priority, items: $items, totalAmount: $totalAmount, prescriptionUrl: $prescriptionUrl, notes: $notes, rejectionReason: $rejectionReason, invoiceUrl: $invoiceUrl, qrCode: $qrCode, deliveryPartnerId: $deliveryPartnerId, deliveryPartnerName: $deliveryPartnerName, deliveryPartnerPhone: $deliveryPartnerPhone, deliveryPartnerLat: $deliveryPartnerLat, deliveryPartnerLng: $deliveryPartnerLng, acceptedAt: $acceptedAt, readyAt: $readyAt, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt)';
}


}

/// @nodoc
abstract mixin class _$OrderEntityCopyWith<$Res> implements $OrderEntityCopyWith<$Res> {
  factory _$OrderEntityCopyWith(_OrderEntity value, $Res Function(_OrderEntity) _then) = __$OrderEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String customerName, String customerPhone, String deliveryAddress, double distance, DateTime orderTime, OrderStatus status, OrderPriority priority, List<OrderItemEntity> items, double totalAmount, String? prescriptionUrl, String? notes, String? rejectionReason, String? invoiceUrl, String? qrCode, String? deliveryPartnerId, String? deliveryPartnerName, String? deliveryPartnerPhone, double? deliveryPartnerLat, double? deliveryPartnerLng, DateTime? acceptedAt, DateTime? readyAt, DateTime? pickedUpAt, DateTime? deliveredAt
});




}
/// @nodoc
class __$OrderEntityCopyWithImpl<$Res>
    implements _$OrderEntityCopyWith<$Res> {
  __$OrderEntityCopyWithImpl(this._self, this._then);

  final _OrderEntity _self;
  final $Res Function(_OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? customerName = null,Object? customerPhone = null,Object? deliveryAddress = null,Object? distance = null,Object? orderTime = null,Object? status = null,Object? priority = null,Object? items = null,Object? totalAmount = null,Object? prescriptionUrl = freezed,Object? notes = freezed,Object? rejectionReason = freezed,Object? invoiceUrl = freezed,Object? qrCode = freezed,Object? deliveryPartnerId = freezed,Object? deliveryPartnerName = freezed,Object? deliveryPartnerPhone = freezed,Object? deliveryPartnerLat = freezed,Object? deliveryPartnerLng = freezed,Object? acceptedAt = freezed,Object? readyAt = freezed,Object? pickedUpAt = freezed,Object? deliveredAt = freezed,}) {
  return _then(_OrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,deliveryAddress: null == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,orderTime: null == orderTime ? _self.orderTime : orderTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as OrderPriority,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,prescriptionUrl: freezed == prescriptionUrl ? _self.prescriptionUrl : prescriptionUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,invoiceUrl: freezed == invoiceUrl ? _self.invoiceUrl : invoiceUrl // ignore: cast_nullable_to_non_nullable
as String?,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as String?,deliveryPartnerId: freezed == deliveryPartnerId ? _self.deliveryPartnerId : deliveryPartnerId // ignore: cast_nullable_to_non_nullable
as String?,deliveryPartnerName: freezed == deliveryPartnerName ? _self.deliveryPartnerName : deliveryPartnerName // ignore: cast_nullable_to_non_nullable
as String?,deliveryPartnerPhone: freezed == deliveryPartnerPhone ? _self.deliveryPartnerPhone : deliveryPartnerPhone // ignore: cast_nullable_to_non_nullable
as String?,deliveryPartnerLat: freezed == deliveryPartnerLat ? _self.deliveryPartnerLat : deliveryPartnerLat // ignore: cast_nullable_to_non_nullable
as double?,deliveryPartnerLng: freezed == deliveryPartnerLng ? _self.deliveryPartnerLng : deliveryPartnerLng // ignore: cast_nullable_to_non_nullable
as double?,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readyAt: freezed == readyAt ? _self.readyAt : readyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pickedUpAt: freezed == pickedUpAt ? _self.pickedUpAt : pickedUpAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$OrderItemEntity {

 String get id; String get medicineName; int get quantity; double get price; ItemAvailability get availability; String? get substituteId; String? get substituteName; double? get substitutePrice; String? get notes;
/// Create a copy of OrderItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemEntityCopyWith<OrderItemEntity> get copyWith => _$OrderItemEntityCopyWithImpl<OrderItemEntity>(this as OrderItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.medicineName, medicineName) || other.medicineName == medicineName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.substituteId, substituteId) || other.substituteId == substituteId)&&(identical(other.substituteName, substituteName) || other.substituteName == substituteName)&&(identical(other.substitutePrice, substitutePrice) || other.substitutePrice == substitutePrice)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,id,medicineName,quantity,price,availability,substituteId,substituteName,substitutePrice,notes);

@override
String toString() {
  return 'OrderItemEntity(id: $id, medicineName: $medicineName, quantity: $quantity, price: $price, availability: $availability, substituteId: $substituteId, substituteName: $substituteName, substitutePrice: $substitutePrice, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $OrderItemEntityCopyWith<$Res>  {
  factory $OrderItemEntityCopyWith(OrderItemEntity value, $Res Function(OrderItemEntity) _then) = _$OrderItemEntityCopyWithImpl;
@useResult
$Res call({
 String id, String medicineName, int quantity, double price, ItemAvailability availability, String? substituteId, String? substituteName, double? substitutePrice, String? notes
});




}
/// @nodoc
class _$OrderItemEntityCopyWithImpl<$Res>
    implements $OrderItemEntityCopyWith<$Res> {
  _$OrderItemEntityCopyWithImpl(this._self, this._then);

  final OrderItemEntity _self;
  final $Res Function(OrderItemEntity) _then;

/// Create a copy of OrderItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? medicineName = null,Object? quantity = null,Object? price = null,Object? availability = null,Object? substituteId = freezed,Object? substituteName = freezed,Object? substitutePrice = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,medicineName: null == medicineName ? _self.medicineName : medicineName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as ItemAvailability,substituteId: freezed == substituteId ? _self.substituteId : substituteId // ignore: cast_nullable_to_non_nullable
as String?,substituteName: freezed == substituteName ? _self.substituteName : substituteName // ignore: cast_nullable_to_non_nullable
as String?,substitutePrice: freezed == substitutePrice ? _self.substitutePrice : substitutePrice // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemEntity].
extension OrderItemEntityPatterns on OrderItemEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String medicineName,  int quantity,  double price,  ItemAvailability availability,  String? substituteId,  String? substituteName,  double? substitutePrice,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemEntity() when $default != null:
return $default(_that.id,_that.medicineName,_that.quantity,_that.price,_that.availability,_that.substituteId,_that.substituteName,_that.substitutePrice,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String medicineName,  int quantity,  double price,  ItemAvailability availability,  String? substituteId,  String? substituteName,  double? substitutePrice,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _OrderItemEntity():
return $default(_that.id,_that.medicineName,_that.quantity,_that.price,_that.availability,_that.substituteId,_that.substituteName,_that.substitutePrice,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String medicineName,  int quantity,  double price,  ItemAvailability availability,  String? substituteId,  String? substituteName,  double? substitutePrice,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemEntity() when $default != null:
return $default(_that.id,_that.medicineName,_that.quantity,_that.price,_that.availability,_that.substituteId,_that.substituteName,_that.substitutePrice,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _OrderItemEntity implements OrderItemEntity {
  const _OrderItemEntity({required this.id, required this.medicineName, required this.quantity, required this.price, required this.availability, this.substituteId, this.substituteName, this.substitutePrice, this.notes});
  

@override final  String id;
@override final  String medicineName;
@override final  int quantity;
@override final  double price;
@override final  ItemAvailability availability;
@override final  String? substituteId;
@override final  String? substituteName;
@override final  double? substitutePrice;
@override final  String? notes;

/// Create a copy of OrderItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemEntityCopyWith<_OrderItemEntity> get copyWith => __$OrderItemEntityCopyWithImpl<_OrderItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.medicineName, medicineName) || other.medicineName == medicineName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.substituteId, substituteId) || other.substituteId == substituteId)&&(identical(other.substituteName, substituteName) || other.substituteName == substituteName)&&(identical(other.substitutePrice, substitutePrice) || other.substitutePrice == substitutePrice)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,id,medicineName,quantity,price,availability,substituteId,substituteName,substitutePrice,notes);

@override
String toString() {
  return 'OrderItemEntity(id: $id, medicineName: $medicineName, quantity: $quantity, price: $price, availability: $availability, substituteId: $substituteId, substituteName: $substituteName, substitutePrice: $substitutePrice, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$OrderItemEntityCopyWith<$Res> implements $OrderItemEntityCopyWith<$Res> {
  factory _$OrderItemEntityCopyWith(_OrderItemEntity value, $Res Function(_OrderItemEntity) _then) = __$OrderItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String medicineName, int quantity, double price, ItemAvailability availability, String? substituteId, String? substituteName, double? substitutePrice, String? notes
});




}
/// @nodoc
class __$OrderItemEntityCopyWithImpl<$Res>
    implements _$OrderItemEntityCopyWith<$Res> {
  __$OrderItemEntityCopyWithImpl(this._self, this._then);

  final _OrderItemEntity _self;
  final $Res Function(_OrderItemEntity) _then;

/// Create a copy of OrderItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? medicineName = null,Object? quantity = null,Object? price = null,Object? availability = null,Object? substituteId = freezed,Object? substituteName = freezed,Object? substitutePrice = freezed,Object? notes = freezed,}) {
  return _then(_OrderItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,medicineName: null == medicineName ? _self.medicineName : medicineName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as ItemAvailability,substituteId: freezed == substituteId ? _self.substituteId : substituteId // ignore: cast_nullable_to_non_nullable
as String?,substituteName: freezed == substituteName ? _self.substituteName : substituteName // ignore: cast_nullable_to_non_nullable
as String?,substitutePrice: freezed == substitutePrice ? _self.substitutePrice : substitutePrice // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
