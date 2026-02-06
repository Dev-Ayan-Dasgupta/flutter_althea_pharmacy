// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionEntity {

 String get id; String get orderId; String get orderNumber; TransactionType get type; TransactionStatus get status; DateTime get transactionDate; double get totalAmount; double get pharmacyAmount; double get deliveryFee; double get fulfillmentFee; String? get customerName; String? get deliveryBoyName; String? get withdrawalMethod; String? get referenceNumber; String? get notes;
/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionEntityCopyWith<TransactionEntity> get copyWith => _$TransactionEntityCopyWithImpl<TransactionEntity>(this as TransactionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.pharmacyAmount, pharmacyAmount) || other.pharmacyAmount == pharmacyAmount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.fulfillmentFee, fulfillmentFee) || other.fulfillmentFee == fulfillmentFee)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.deliveryBoyName, deliveryBoyName) || other.deliveryBoyName == deliveryBoyName)&&(identical(other.withdrawalMethod, withdrawalMethod) || other.withdrawalMethod == withdrawalMethod)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,id,orderId,orderNumber,type,status,transactionDate,totalAmount,pharmacyAmount,deliveryFee,fulfillmentFee,customerName,deliveryBoyName,withdrawalMethod,referenceNumber,notes);

@override
String toString() {
  return 'TransactionEntity(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, transactionDate: $transactionDate, totalAmount: $totalAmount, pharmacyAmount: $pharmacyAmount, deliveryFee: $deliveryFee, fulfillmentFee: $fulfillmentFee, customerName: $customerName, deliveryBoyName: $deliveryBoyName, withdrawalMethod: $withdrawalMethod, referenceNumber: $referenceNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $TransactionEntityCopyWith<$Res>  {
  factory $TransactionEntityCopyWith(TransactionEntity value, $Res Function(TransactionEntity) _then) = _$TransactionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String orderNumber, TransactionType type, TransactionStatus status, DateTime transactionDate, double totalAmount, double pharmacyAmount, double deliveryFee, double fulfillmentFee, String? customerName, String? deliveryBoyName, String? withdrawalMethod, String? referenceNumber, String? notes
});




}
/// @nodoc
class _$TransactionEntityCopyWithImpl<$Res>
    implements $TransactionEntityCopyWith<$Res> {
  _$TransactionEntityCopyWithImpl(this._self, this._then);

  final TransactionEntity _self;
  final $Res Function(TransactionEntity) _then;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? orderNumber = null,Object? type = null,Object? status = null,Object? transactionDate = null,Object? totalAmount = null,Object? pharmacyAmount = null,Object? deliveryFee = null,Object? fulfillmentFee = null,Object? customerName = freezed,Object? deliveryBoyName = freezed,Object? withdrawalMethod = freezed,Object? referenceNumber = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransactionStatus,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,pharmacyAmount: null == pharmacyAmount ? _self.pharmacyAmount : pharmacyAmount // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,fulfillmentFee: null == fulfillmentFee ? _self.fulfillmentFee : fulfillmentFee // ignore: cast_nullable_to_non_nullable
as double,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,deliveryBoyName: freezed == deliveryBoyName ? _self.deliveryBoyName : deliveryBoyName // ignore: cast_nullable_to_non_nullable
as String?,withdrawalMethod: freezed == withdrawalMethod ? _self.withdrawalMethod : withdrawalMethod // ignore: cast_nullable_to_non_nullable
as String?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionEntity].
extension TransactionEntityPatterns on TransactionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionEntity value)  $default,){
final _that = this;
switch (_that) {
case _TransactionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String orderNumber,  TransactionType type,  TransactionStatus status,  DateTime transactionDate,  double totalAmount,  double pharmacyAmount,  double deliveryFee,  double fulfillmentFee,  String? customerName,  String? deliveryBoyName,  String? withdrawalMethod,  String? referenceNumber,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
return $default(_that.id,_that.orderId,_that.orderNumber,_that.type,_that.status,_that.transactionDate,_that.totalAmount,_that.pharmacyAmount,_that.deliveryFee,_that.fulfillmentFee,_that.customerName,_that.deliveryBoyName,_that.withdrawalMethod,_that.referenceNumber,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String orderNumber,  TransactionType type,  TransactionStatus status,  DateTime transactionDate,  double totalAmount,  double pharmacyAmount,  double deliveryFee,  double fulfillmentFee,  String? customerName,  String? deliveryBoyName,  String? withdrawalMethod,  String? referenceNumber,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _TransactionEntity():
return $default(_that.id,_that.orderId,_that.orderNumber,_that.type,_that.status,_that.transactionDate,_that.totalAmount,_that.pharmacyAmount,_that.deliveryFee,_that.fulfillmentFee,_that.customerName,_that.deliveryBoyName,_that.withdrawalMethod,_that.referenceNumber,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String orderNumber,  TransactionType type,  TransactionStatus status,  DateTime transactionDate,  double totalAmount,  double pharmacyAmount,  double deliveryFee,  double fulfillmentFee,  String? customerName,  String? deliveryBoyName,  String? withdrawalMethod,  String? referenceNumber,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
return $default(_that.id,_that.orderId,_that.orderNumber,_that.type,_that.status,_that.transactionDate,_that.totalAmount,_that.pharmacyAmount,_that.deliveryFee,_that.fulfillmentFee,_that.customerName,_that.deliveryBoyName,_that.withdrawalMethod,_that.referenceNumber,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionEntity extends TransactionEntity {
  const _TransactionEntity({required this.id, required this.orderId, required this.orderNumber, required this.type, required this.status, required this.transactionDate, required this.totalAmount, required this.pharmacyAmount, required this.deliveryFee, required this.fulfillmentFee, this.customerName, this.deliveryBoyName, this.withdrawalMethod, this.referenceNumber, this.notes}): super._();
  

@override final  String id;
@override final  String orderId;
@override final  String orderNumber;
@override final  TransactionType type;
@override final  TransactionStatus status;
@override final  DateTime transactionDate;
@override final  double totalAmount;
@override final  double pharmacyAmount;
@override final  double deliveryFee;
@override final  double fulfillmentFee;
@override final  String? customerName;
@override final  String? deliveryBoyName;
@override final  String? withdrawalMethod;
@override final  String? referenceNumber;
@override final  String? notes;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionEntityCopyWith<_TransactionEntity> get copyWith => __$TransactionEntityCopyWithImpl<_TransactionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.pharmacyAmount, pharmacyAmount) || other.pharmacyAmount == pharmacyAmount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.fulfillmentFee, fulfillmentFee) || other.fulfillmentFee == fulfillmentFee)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.deliveryBoyName, deliveryBoyName) || other.deliveryBoyName == deliveryBoyName)&&(identical(other.withdrawalMethod, withdrawalMethod) || other.withdrawalMethod == withdrawalMethod)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,id,orderId,orderNumber,type,status,transactionDate,totalAmount,pharmacyAmount,deliveryFee,fulfillmentFee,customerName,deliveryBoyName,withdrawalMethod,referenceNumber,notes);

@override
String toString() {
  return 'TransactionEntity(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, transactionDate: $transactionDate, totalAmount: $totalAmount, pharmacyAmount: $pharmacyAmount, deliveryFee: $deliveryFee, fulfillmentFee: $fulfillmentFee, customerName: $customerName, deliveryBoyName: $deliveryBoyName, withdrawalMethod: $withdrawalMethod, referenceNumber: $referenceNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$TransactionEntityCopyWith<$Res> implements $TransactionEntityCopyWith<$Res> {
  factory _$TransactionEntityCopyWith(_TransactionEntity value, $Res Function(_TransactionEntity) _then) = __$TransactionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String orderNumber, TransactionType type, TransactionStatus status, DateTime transactionDate, double totalAmount, double pharmacyAmount, double deliveryFee, double fulfillmentFee, String? customerName, String? deliveryBoyName, String? withdrawalMethod, String? referenceNumber, String? notes
});




}
/// @nodoc
class __$TransactionEntityCopyWithImpl<$Res>
    implements _$TransactionEntityCopyWith<$Res> {
  __$TransactionEntityCopyWithImpl(this._self, this._then);

  final _TransactionEntity _self;
  final $Res Function(_TransactionEntity) _then;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? orderNumber = null,Object? type = null,Object? status = null,Object? transactionDate = null,Object? totalAmount = null,Object? pharmacyAmount = null,Object? deliveryFee = null,Object? fulfillmentFee = null,Object? customerName = freezed,Object? deliveryBoyName = freezed,Object? withdrawalMethod = freezed,Object? referenceNumber = freezed,Object? notes = freezed,}) {
  return _then(_TransactionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransactionStatus,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,pharmacyAmount: null == pharmacyAmount ? _self.pharmacyAmount : pharmacyAmount // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,fulfillmentFee: null == fulfillmentFee ? _self.fulfillmentFee : fulfillmentFee // ignore: cast_nullable_to_non_nullable
as double,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,deliveryBoyName: freezed == deliveryBoyName ? _self.deliveryBoyName : deliveryBoyName // ignore: cast_nullable_to_non_nullable
as String?,withdrawalMethod: freezed == withdrawalMethod ? _self.withdrawalMethod : withdrawalMethod // ignore: cast_nullable_to_non_nullable
as String?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
