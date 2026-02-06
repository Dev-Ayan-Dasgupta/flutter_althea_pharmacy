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

 String get id; String get orderNumber; String get customerName; String get customerPhone; String get deliveryAddress; DateTime get orderTime; OrderStatus get status; OrderPriority get priority; double get totalAmount; int get itemCount; List<MedicineItemEntity> get medicines; String? get prescriptionImageUrl; String? get deliveryBoyName; String? get deliveryBoyPhone; DateTime? get estimatedDeliveryTime; String? get specialInstructions;
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<OrderEntity> get copyWith => _$OrderEntityCopyWithImpl<OrderEntity>(this as OrderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.orderTime, orderTime) || other.orderTime == orderTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&const DeepCollectionEquality().equals(other.medicines, medicines)&&(identical(other.prescriptionImageUrl, prescriptionImageUrl) || other.prescriptionImageUrl == prescriptionImageUrl)&&(identical(other.deliveryBoyName, deliveryBoyName) || other.deliveryBoyName == deliveryBoyName)&&(identical(other.deliveryBoyPhone, deliveryBoyPhone) || other.deliveryBoyPhone == deliveryBoyPhone)&&(identical(other.estimatedDeliveryTime, estimatedDeliveryTime) || other.estimatedDeliveryTime == estimatedDeliveryTime)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions));
}


@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,customerName,customerPhone,deliveryAddress,orderTime,status,priority,totalAmount,itemCount,const DeepCollectionEquality().hash(medicines),prescriptionImageUrl,deliveryBoyName,deliveryBoyPhone,estimatedDeliveryTime,specialInstructions);

@override
String toString() {
  return 'OrderEntity(id: $id, orderNumber: $orderNumber, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, orderTime: $orderTime, status: $status, priority: $priority, totalAmount: $totalAmount, itemCount: $itemCount, medicines: $medicines, prescriptionImageUrl: $prescriptionImageUrl, deliveryBoyName: $deliveryBoyName, deliveryBoyPhone: $deliveryBoyPhone, estimatedDeliveryTime: $estimatedDeliveryTime, specialInstructions: $specialInstructions)';
}


}

/// @nodoc
abstract mixin class $OrderEntityCopyWith<$Res>  {
  factory $OrderEntityCopyWith(OrderEntity value, $Res Function(OrderEntity) _then) = _$OrderEntityCopyWithImpl;
@useResult
$Res call({
 String id, String orderNumber, String customerName, String customerPhone, String deliveryAddress, DateTime orderTime, OrderStatus status, OrderPriority priority, double totalAmount, int itemCount, List<MedicineItemEntity> medicines, String? prescriptionImageUrl, String? deliveryBoyName, String? deliveryBoyPhone, DateTime? estimatedDeliveryTime, String? specialInstructions
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? customerName = null,Object? customerPhone = null,Object? deliveryAddress = null,Object? orderTime = null,Object? status = null,Object? priority = null,Object? totalAmount = null,Object? itemCount = null,Object? medicines = null,Object? prescriptionImageUrl = freezed,Object? deliveryBoyName = freezed,Object? deliveryBoyPhone = freezed,Object? estimatedDeliveryTime = freezed,Object? specialInstructions = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,deliveryAddress: null == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String,orderTime: null == orderTime ? _self.orderTime : orderTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as OrderPriority,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,medicines: null == medicines ? _self.medicines : medicines // ignore: cast_nullable_to_non_nullable
as List<MedicineItemEntity>,prescriptionImageUrl: freezed == prescriptionImageUrl ? _self.prescriptionImageUrl : prescriptionImageUrl // ignore: cast_nullable_to_non_nullable
as String?,deliveryBoyName: freezed == deliveryBoyName ? _self.deliveryBoyName : deliveryBoyName // ignore: cast_nullable_to_non_nullable
as String?,deliveryBoyPhone: freezed == deliveryBoyPhone ? _self.deliveryBoyPhone : deliveryBoyPhone // ignore: cast_nullable_to_non_nullable
as String?,estimatedDeliveryTime: freezed == estimatedDeliveryTime ? _self.estimatedDeliveryTime : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
as DateTime?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderNumber,  String customerName,  String customerPhone,  String deliveryAddress,  DateTime orderTime,  OrderStatus status,  OrderPriority priority,  double totalAmount,  int itemCount,  List<MedicineItemEntity> medicines,  String? prescriptionImageUrl,  String? deliveryBoyName,  String? deliveryBoyPhone,  DateTime? estimatedDeliveryTime,  String? specialInstructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.orderNumber,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.orderTime,_that.status,_that.priority,_that.totalAmount,_that.itemCount,_that.medicines,_that.prescriptionImageUrl,_that.deliveryBoyName,_that.deliveryBoyPhone,_that.estimatedDeliveryTime,_that.specialInstructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderNumber,  String customerName,  String customerPhone,  String deliveryAddress,  DateTime orderTime,  OrderStatus status,  OrderPriority priority,  double totalAmount,  int itemCount,  List<MedicineItemEntity> medicines,  String? prescriptionImageUrl,  String? deliveryBoyName,  String? deliveryBoyPhone,  DateTime? estimatedDeliveryTime,  String? specialInstructions)  $default,) {final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that.id,_that.orderNumber,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.orderTime,_that.status,_that.priority,_that.totalAmount,_that.itemCount,_that.medicines,_that.prescriptionImageUrl,_that.deliveryBoyName,_that.deliveryBoyPhone,_that.estimatedDeliveryTime,_that.specialInstructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderNumber,  String customerName,  String customerPhone,  String deliveryAddress,  DateTime orderTime,  OrderStatus status,  OrderPriority priority,  double totalAmount,  int itemCount,  List<MedicineItemEntity> medicines,  String? prescriptionImageUrl,  String? deliveryBoyName,  String? deliveryBoyPhone,  DateTime? estimatedDeliveryTime,  String? specialInstructions)?  $default,) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.orderNumber,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.orderTime,_that.status,_that.priority,_that.totalAmount,_that.itemCount,_that.medicines,_that.prescriptionImageUrl,_that.deliveryBoyName,_that.deliveryBoyPhone,_that.estimatedDeliveryTime,_that.specialInstructions);case _:
  return null;

}
}

}

/// @nodoc


class _OrderEntity extends OrderEntity {
  const _OrderEntity({required this.id, required this.orderNumber, required this.customerName, required this.customerPhone, required this.deliveryAddress, required this.orderTime, required this.status, required this.priority, required this.totalAmount, required this.itemCount, required final  List<MedicineItemEntity> medicines, this.prescriptionImageUrl, this.deliveryBoyName, this.deliveryBoyPhone, this.estimatedDeliveryTime, this.specialInstructions}): _medicines = medicines,super._();
  

@override final  String id;
@override final  String orderNumber;
@override final  String customerName;
@override final  String customerPhone;
@override final  String deliveryAddress;
@override final  DateTime orderTime;
@override final  OrderStatus status;
@override final  OrderPriority priority;
@override final  double totalAmount;
@override final  int itemCount;
 final  List<MedicineItemEntity> _medicines;
@override List<MedicineItemEntity> get medicines {
  if (_medicines is EqualUnmodifiableListView) return _medicines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medicines);
}

@override final  String? prescriptionImageUrl;
@override final  String? deliveryBoyName;
@override final  String? deliveryBoyPhone;
@override final  DateTime? estimatedDeliveryTime;
@override final  String? specialInstructions;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderEntityCopyWith<_OrderEntity> get copyWith => __$OrderEntityCopyWithImpl<_OrderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.orderTime, orderTime) || other.orderTime == orderTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&const DeepCollectionEquality().equals(other._medicines, _medicines)&&(identical(other.prescriptionImageUrl, prescriptionImageUrl) || other.prescriptionImageUrl == prescriptionImageUrl)&&(identical(other.deliveryBoyName, deliveryBoyName) || other.deliveryBoyName == deliveryBoyName)&&(identical(other.deliveryBoyPhone, deliveryBoyPhone) || other.deliveryBoyPhone == deliveryBoyPhone)&&(identical(other.estimatedDeliveryTime, estimatedDeliveryTime) || other.estimatedDeliveryTime == estimatedDeliveryTime)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions));
}


@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,customerName,customerPhone,deliveryAddress,orderTime,status,priority,totalAmount,itemCount,const DeepCollectionEquality().hash(_medicines),prescriptionImageUrl,deliveryBoyName,deliveryBoyPhone,estimatedDeliveryTime,specialInstructions);

@override
String toString() {
  return 'OrderEntity(id: $id, orderNumber: $orderNumber, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, orderTime: $orderTime, status: $status, priority: $priority, totalAmount: $totalAmount, itemCount: $itemCount, medicines: $medicines, prescriptionImageUrl: $prescriptionImageUrl, deliveryBoyName: $deliveryBoyName, deliveryBoyPhone: $deliveryBoyPhone, estimatedDeliveryTime: $estimatedDeliveryTime, specialInstructions: $specialInstructions)';
}


}

/// @nodoc
abstract mixin class _$OrderEntityCopyWith<$Res> implements $OrderEntityCopyWith<$Res> {
  factory _$OrderEntityCopyWith(_OrderEntity value, $Res Function(_OrderEntity) _then) = __$OrderEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderNumber, String customerName, String customerPhone, String deliveryAddress, DateTime orderTime, OrderStatus status, OrderPriority priority, double totalAmount, int itemCount, List<MedicineItemEntity> medicines, String? prescriptionImageUrl, String? deliveryBoyName, String? deliveryBoyPhone, DateTime? estimatedDeliveryTime, String? specialInstructions
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? customerName = null,Object? customerPhone = null,Object? deliveryAddress = null,Object? orderTime = null,Object? status = null,Object? priority = null,Object? totalAmount = null,Object? itemCount = null,Object? medicines = null,Object? prescriptionImageUrl = freezed,Object? deliveryBoyName = freezed,Object? deliveryBoyPhone = freezed,Object? estimatedDeliveryTime = freezed,Object? specialInstructions = freezed,}) {
  return _then(_OrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,deliveryAddress: null == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String,orderTime: null == orderTime ? _self.orderTime : orderTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as OrderPriority,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,medicines: null == medicines ? _self._medicines : medicines // ignore: cast_nullable_to_non_nullable
as List<MedicineItemEntity>,prescriptionImageUrl: freezed == prescriptionImageUrl ? _self.prescriptionImageUrl : prescriptionImageUrl // ignore: cast_nullable_to_non_nullable
as String?,deliveryBoyName: freezed == deliveryBoyName ? _self.deliveryBoyName : deliveryBoyName // ignore: cast_nullable_to_non_nullable
as String?,deliveryBoyPhone: freezed == deliveryBoyPhone ? _self.deliveryBoyPhone : deliveryBoyPhone // ignore: cast_nullable_to_non_nullable
as String?,estimatedDeliveryTime: freezed == estimatedDeliveryTime ? _self.estimatedDeliveryTime : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
as DateTime?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$MedicineItemEntity {

 String get id; String get name; String get dosage; int get quantity; double get price; String? get brandName; String? get genericName; bool? get isScheduledDrug;
/// Create a copy of MedicineItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicineItemEntityCopyWith<MedicineItemEntity> get copyWith => _$MedicineItemEntityCopyWithImpl<MedicineItemEntity>(this as MedicineItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicineItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.isScheduledDrug, isScheduledDrug) || other.isScheduledDrug == isScheduledDrug));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,dosage,quantity,price,brandName,genericName,isScheduledDrug);

@override
String toString() {
  return 'MedicineItemEntity(id: $id, name: $name, dosage: $dosage, quantity: $quantity, price: $price, brandName: $brandName, genericName: $genericName, isScheduledDrug: $isScheduledDrug)';
}


}

/// @nodoc
abstract mixin class $MedicineItemEntityCopyWith<$Res>  {
  factory $MedicineItemEntityCopyWith(MedicineItemEntity value, $Res Function(MedicineItemEntity) _then) = _$MedicineItemEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String dosage, int quantity, double price, String? brandName, String? genericName, bool? isScheduledDrug
});




}
/// @nodoc
class _$MedicineItemEntityCopyWithImpl<$Res>
    implements $MedicineItemEntityCopyWith<$Res> {
  _$MedicineItemEntityCopyWithImpl(this._self, this._then);

  final MedicineItemEntity _self;
  final $Res Function(MedicineItemEntity) _then;

/// Create a copy of MedicineItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? dosage = null,Object? quantity = null,Object? price = null,Object? brandName = freezed,Object? genericName = freezed,Object? isScheduledDrug = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,genericName: freezed == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String?,isScheduledDrug: freezed == isScheduledDrug ? _self.isScheduledDrug : isScheduledDrug // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicineItemEntity].
extension MedicineItemEntityPatterns on MedicineItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicineItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicineItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicineItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _MedicineItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicineItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MedicineItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String dosage,  int quantity,  double price,  String? brandName,  String? genericName,  bool? isScheduledDrug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicineItemEntity() when $default != null:
return $default(_that.id,_that.name,_that.dosage,_that.quantity,_that.price,_that.brandName,_that.genericName,_that.isScheduledDrug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String dosage,  int quantity,  double price,  String? brandName,  String? genericName,  bool? isScheduledDrug)  $default,) {final _that = this;
switch (_that) {
case _MedicineItemEntity():
return $default(_that.id,_that.name,_that.dosage,_that.quantity,_that.price,_that.brandName,_that.genericName,_that.isScheduledDrug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String dosage,  int quantity,  double price,  String? brandName,  String? genericName,  bool? isScheduledDrug)?  $default,) {final _that = this;
switch (_that) {
case _MedicineItemEntity() when $default != null:
return $default(_that.id,_that.name,_that.dosage,_that.quantity,_that.price,_that.brandName,_that.genericName,_that.isScheduledDrug);case _:
  return null;

}
}

}

/// @nodoc


class _MedicineItemEntity implements MedicineItemEntity {
  const _MedicineItemEntity({required this.id, required this.name, required this.dosage, required this.quantity, required this.price, this.brandName, this.genericName, this.isScheduledDrug});
  

@override final  String id;
@override final  String name;
@override final  String dosage;
@override final  int quantity;
@override final  double price;
@override final  String? brandName;
@override final  String? genericName;
@override final  bool? isScheduledDrug;

/// Create a copy of MedicineItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicineItemEntityCopyWith<_MedicineItemEntity> get copyWith => __$MedicineItemEntityCopyWithImpl<_MedicineItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicineItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.isScheduledDrug, isScheduledDrug) || other.isScheduledDrug == isScheduledDrug));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,dosage,quantity,price,brandName,genericName,isScheduledDrug);

@override
String toString() {
  return 'MedicineItemEntity(id: $id, name: $name, dosage: $dosage, quantity: $quantity, price: $price, brandName: $brandName, genericName: $genericName, isScheduledDrug: $isScheduledDrug)';
}


}

/// @nodoc
abstract mixin class _$MedicineItemEntityCopyWith<$Res> implements $MedicineItemEntityCopyWith<$Res> {
  factory _$MedicineItemEntityCopyWith(_MedicineItemEntity value, $Res Function(_MedicineItemEntity) _then) = __$MedicineItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String dosage, int quantity, double price, String? brandName, String? genericName, bool? isScheduledDrug
});




}
/// @nodoc
class __$MedicineItemEntityCopyWithImpl<$Res>
    implements _$MedicineItemEntityCopyWith<$Res> {
  __$MedicineItemEntityCopyWithImpl(this._self, this._then);

  final _MedicineItemEntity _self;
  final $Res Function(_MedicineItemEntity) _then;

/// Create a copy of MedicineItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? dosage = null,Object? quantity = null,Object? price = null,Object? brandName = freezed,Object? genericName = freezed,Object? isScheduledDrug = freezed,}) {
  return _then(_MedicineItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,genericName: freezed == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String?,isScheduledDrug: freezed == isScheduledDrug ? _self.isScheduledDrug : isScheduledDrug // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
