// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionModel {

 String get id; String get orderId; String get orderNumber; String get type; String get status; DateTime get transactionDate; double get totalAmount; double get pharmacyAmount; double get deliveryFee; double get fulfillmentFee; String? get customerName; String? get deliveryBoyName; String? get withdrawalMethod; String? get referenceNumber; String? get notes;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.pharmacyAmount, pharmacyAmount) || other.pharmacyAmount == pharmacyAmount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.fulfillmentFee, fulfillmentFee) || other.fulfillmentFee == fulfillmentFee)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.deliveryBoyName, deliveryBoyName) || other.deliveryBoyName == deliveryBoyName)&&(identical(other.withdrawalMethod, withdrawalMethod) || other.withdrawalMethod == withdrawalMethod)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,orderNumber,type,status,transactionDate,totalAmount,pharmacyAmount,deliveryFee,fulfillmentFee,customerName,deliveryBoyName,withdrawalMethod,referenceNumber,notes);

@override
String toString() {
  return 'TransactionModel(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, transactionDate: $transactionDate, totalAmount: $totalAmount, pharmacyAmount: $pharmacyAmount, deliveryFee: $deliveryFee, fulfillmentFee: $fulfillmentFee, customerName: $customerName, deliveryBoyName: $deliveryBoyName, withdrawalMethod: $withdrawalMethod, referenceNumber: $referenceNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String orderNumber, String type, String status, DateTime transactionDate, double totalAmount, double pharmacyAmount, double deliveryFee, double fulfillmentFee, String? customerName, String? deliveryBoyName, String? withdrawalMethod, String? referenceNumber, String? notes
});




}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? orderNumber = null,Object? type = null,Object? status = null,Object? transactionDate = null,Object? totalAmount = null,Object? pharmacyAmount = null,Object? deliveryFee = null,Object? fulfillmentFee = null,Object? customerName = freezed,Object? deliveryBoyName = freezed,Object? withdrawalMethod = freezed,Object? referenceNumber = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String orderNumber,  String type,  String status,  DateTime transactionDate,  double totalAmount,  double pharmacyAmount,  double deliveryFee,  double fulfillmentFee,  String? customerName,  String? deliveryBoyName,  String? withdrawalMethod,  String? referenceNumber,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String orderNumber,  String type,  String status,  DateTime transactionDate,  double totalAmount,  double pharmacyAmount,  double deliveryFee,  double fulfillmentFee,  String? customerName,  String? deliveryBoyName,  String? withdrawalMethod,  String? referenceNumber,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String orderNumber,  String type,  String status,  DateTime transactionDate,  double totalAmount,  double pharmacyAmount,  double deliveryFee,  double fulfillmentFee,  String? customerName,  String? deliveryBoyName,  String? withdrawalMethod,  String? referenceNumber,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.orderId,_that.orderNumber,_that.type,_that.status,_that.transactionDate,_that.totalAmount,_that.pharmacyAmount,_that.deliveryFee,_that.fulfillmentFee,_that.customerName,_that.deliveryBoyName,_that.withdrawalMethod,_that.referenceNumber,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionModel extends TransactionModel {
  const _TransactionModel({required this.id, required this.orderId, required this.orderNumber, required this.type, required this.status, required this.transactionDate, required this.totalAmount, required this.pharmacyAmount, required this.deliveryFee, required this.fulfillmentFee, this.customerName, this.deliveryBoyName, this.withdrawalMethod, this.referenceNumber, this.notes}): super._();
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override final  String id;
@override final  String orderId;
@override final  String orderNumber;
@override final  String type;
@override final  String status;
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

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.pharmacyAmount, pharmacyAmount) || other.pharmacyAmount == pharmacyAmount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.fulfillmentFee, fulfillmentFee) || other.fulfillmentFee == fulfillmentFee)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.deliveryBoyName, deliveryBoyName) || other.deliveryBoyName == deliveryBoyName)&&(identical(other.withdrawalMethod, withdrawalMethod) || other.withdrawalMethod == withdrawalMethod)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,orderNumber,type,status,transactionDate,totalAmount,pharmacyAmount,deliveryFee,fulfillmentFee,customerName,deliveryBoyName,withdrawalMethod,referenceNumber,notes);

@override
String toString() {
  return 'TransactionModel(id: $id, orderId: $orderId, orderNumber: $orderNumber, type: $type, status: $status, transactionDate: $transactionDate, totalAmount: $totalAmount, pharmacyAmount: $pharmacyAmount, deliveryFee: $deliveryFee, fulfillmentFee: $fulfillmentFee, customerName: $customerName, deliveryBoyName: $deliveryBoyName, withdrawalMethod: $withdrawalMethod, referenceNumber: $referenceNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String orderNumber, String type, String status, DateTime transactionDate, double totalAmount, double pharmacyAmount, double deliveryFee, double fulfillmentFee, String? customerName, String? deliveryBoyName, String? withdrawalMethod, String? referenceNumber, String? notes
});




}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? orderNumber = null,Object? type = null,Object? status = null,Object? transactionDate = null,Object? totalAmount = null,Object? pharmacyAmount = null,Object? deliveryFee = null,Object? fulfillmentFee = null,Object? customerName = freezed,Object? deliveryBoyName = freezed,Object? withdrawalMethod = freezed,Object? referenceNumber = freezed,Object? notes = freezed,}) {
  return _then(_TransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
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
