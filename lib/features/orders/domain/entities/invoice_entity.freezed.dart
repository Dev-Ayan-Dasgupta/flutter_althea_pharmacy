// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvoiceEntity {

 String get invoiceNumber; String get orderId; DateTime get generatedAt; String get customerName; String get customerPhone; String get deliveryAddress; String get pharmacyName; String get pharmacyAddress; String get pharmacyPhone; String get pharmacyGSTIN; String get pharmacyLicense; List<InvoiceItemEntity> get items; double get subtotal; double get cgst; double get sgst; double get deliveryFee; double get total; String? get notes;
/// Create a copy of InvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceEntityCopyWith<InvoiceEntity> get copyWith => _$InvoiceEntityCopyWithImpl<InvoiceEntity>(this as InvoiceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceEntity&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.pharmacyName, pharmacyName) || other.pharmacyName == pharmacyName)&&(identical(other.pharmacyAddress, pharmacyAddress) || other.pharmacyAddress == pharmacyAddress)&&(identical(other.pharmacyPhone, pharmacyPhone) || other.pharmacyPhone == pharmacyPhone)&&(identical(other.pharmacyGSTIN, pharmacyGSTIN) || other.pharmacyGSTIN == pharmacyGSTIN)&&(identical(other.pharmacyLicense, pharmacyLicense) || other.pharmacyLicense == pharmacyLicense)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.cgst, cgst) || other.cgst == cgst)&&(identical(other.sgst, sgst) || other.sgst == sgst)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,invoiceNumber,orderId,generatedAt,customerName,customerPhone,deliveryAddress,pharmacyName,pharmacyAddress,pharmacyPhone,pharmacyGSTIN,pharmacyLicense,const DeepCollectionEquality().hash(items),subtotal,cgst,sgst,deliveryFee,total,notes);

@override
String toString() {
  return 'InvoiceEntity(invoiceNumber: $invoiceNumber, orderId: $orderId, generatedAt: $generatedAt, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, pharmacyName: $pharmacyName, pharmacyAddress: $pharmacyAddress, pharmacyPhone: $pharmacyPhone, pharmacyGSTIN: $pharmacyGSTIN, pharmacyLicense: $pharmacyLicense, items: $items, subtotal: $subtotal, cgst: $cgst, sgst: $sgst, deliveryFee: $deliveryFee, total: $total, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $InvoiceEntityCopyWith<$Res>  {
  factory $InvoiceEntityCopyWith(InvoiceEntity value, $Res Function(InvoiceEntity) _then) = _$InvoiceEntityCopyWithImpl;
@useResult
$Res call({
 String invoiceNumber, String orderId, DateTime generatedAt, String customerName, String customerPhone, String deliveryAddress, String pharmacyName, String pharmacyAddress, String pharmacyPhone, String pharmacyGSTIN, String pharmacyLicense, List<InvoiceItemEntity> items, double subtotal, double cgst, double sgst, double deliveryFee, double total, String? notes
});




}
/// @nodoc
class _$InvoiceEntityCopyWithImpl<$Res>
    implements $InvoiceEntityCopyWith<$Res> {
  _$InvoiceEntityCopyWithImpl(this._self, this._then);

  final InvoiceEntity _self;
  final $Res Function(InvoiceEntity) _then;

/// Create a copy of InvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoiceNumber = null,Object? orderId = null,Object? generatedAt = null,Object? customerName = null,Object? customerPhone = null,Object? deliveryAddress = null,Object? pharmacyName = null,Object? pharmacyAddress = null,Object? pharmacyPhone = null,Object? pharmacyGSTIN = null,Object? pharmacyLicense = null,Object? items = null,Object? subtotal = null,Object? cgst = null,Object? sgst = null,Object? deliveryFee = null,Object? total = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,deliveryAddress: null == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String,pharmacyName: null == pharmacyName ? _self.pharmacyName : pharmacyName // ignore: cast_nullable_to_non_nullable
as String,pharmacyAddress: null == pharmacyAddress ? _self.pharmacyAddress : pharmacyAddress // ignore: cast_nullable_to_non_nullable
as String,pharmacyPhone: null == pharmacyPhone ? _self.pharmacyPhone : pharmacyPhone // ignore: cast_nullable_to_non_nullable
as String,pharmacyGSTIN: null == pharmacyGSTIN ? _self.pharmacyGSTIN : pharmacyGSTIN // ignore: cast_nullable_to_non_nullable
as String,pharmacyLicense: null == pharmacyLicense ? _self.pharmacyLicense : pharmacyLicense // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceItemEntity>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,cgst: null == cgst ? _self.cgst : cgst // ignore: cast_nullable_to_non_nullable
as double,sgst: null == sgst ? _self.sgst : sgst // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceEntity].
extension InvoiceEntityPatterns on InvoiceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceEntity value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String invoiceNumber,  String orderId,  DateTime generatedAt,  String customerName,  String customerPhone,  String deliveryAddress,  String pharmacyName,  String pharmacyAddress,  String pharmacyPhone,  String pharmacyGSTIN,  String pharmacyLicense,  List<InvoiceItemEntity> items,  double subtotal,  double cgst,  double sgst,  double deliveryFee,  double total,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceEntity() when $default != null:
return $default(_that.invoiceNumber,_that.orderId,_that.generatedAt,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.pharmacyName,_that.pharmacyAddress,_that.pharmacyPhone,_that.pharmacyGSTIN,_that.pharmacyLicense,_that.items,_that.subtotal,_that.cgst,_that.sgst,_that.deliveryFee,_that.total,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String invoiceNumber,  String orderId,  DateTime generatedAt,  String customerName,  String customerPhone,  String deliveryAddress,  String pharmacyName,  String pharmacyAddress,  String pharmacyPhone,  String pharmacyGSTIN,  String pharmacyLicense,  List<InvoiceItemEntity> items,  double subtotal,  double cgst,  double sgst,  double deliveryFee,  double total,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _InvoiceEntity():
return $default(_that.invoiceNumber,_that.orderId,_that.generatedAt,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.pharmacyName,_that.pharmacyAddress,_that.pharmacyPhone,_that.pharmacyGSTIN,_that.pharmacyLicense,_that.items,_that.subtotal,_that.cgst,_that.sgst,_that.deliveryFee,_that.total,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String invoiceNumber,  String orderId,  DateTime generatedAt,  String customerName,  String customerPhone,  String deliveryAddress,  String pharmacyName,  String pharmacyAddress,  String pharmacyPhone,  String pharmacyGSTIN,  String pharmacyLicense,  List<InvoiceItemEntity> items,  double subtotal,  double cgst,  double sgst,  double deliveryFee,  double total,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceEntity() when $default != null:
return $default(_that.invoiceNumber,_that.orderId,_that.generatedAt,_that.customerName,_that.customerPhone,_that.deliveryAddress,_that.pharmacyName,_that.pharmacyAddress,_that.pharmacyPhone,_that.pharmacyGSTIN,_that.pharmacyLicense,_that.items,_that.subtotal,_that.cgst,_that.sgst,_that.deliveryFee,_that.total,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _InvoiceEntity implements InvoiceEntity {
  const _InvoiceEntity({required this.invoiceNumber, required this.orderId, required this.generatedAt, required this.customerName, required this.customerPhone, required this.deliveryAddress, required this.pharmacyName, required this.pharmacyAddress, required this.pharmacyPhone, required this.pharmacyGSTIN, required this.pharmacyLicense, required final  List<InvoiceItemEntity> items, required this.subtotal, required this.cgst, required this.sgst, required this.deliveryFee, required this.total, this.notes}): _items = items;
  

@override final  String invoiceNumber;
@override final  String orderId;
@override final  DateTime generatedAt;
@override final  String customerName;
@override final  String customerPhone;
@override final  String deliveryAddress;
@override final  String pharmacyName;
@override final  String pharmacyAddress;
@override final  String pharmacyPhone;
@override final  String pharmacyGSTIN;
@override final  String pharmacyLicense;
 final  List<InvoiceItemEntity> _items;
@override List<InvoiceItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double subtotal;
@override final  double cgst;
@override final  double sgst;
@override final  double deliveryFee;
@override final  double total;
@override final  String? notes;

/// Create a copy of InvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceEntityCopyWith<_InvoiceEntity> get copyWith => __$InvoiceEntityCopyWithImpl<_InvoiceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceEntity&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.pharmacyName, pharmacyName) || other.pharmacyName == pharmacyName)&&(identical(other.pharmacyAddress, pharmacyAddress) || other.pharmacyAddress == pharmacyAddress)&&(identical(other.pharmacyPhone, pharmacyPhone) || other.pharmacyPhone == pharmacyPhone)&&(identical(other.pharmacyGSTIN, pharmacyGSTIN) || other.pharmacyGSTIN == pharmacyGSTIN)&&(identical(other.pharmacyLicense, pharmacyLicense) || other.pharmacyLicense == pharmacyLicense)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.cgst, cgst) || other.cgst == cgst)&&(identical(other.sgst, sgst) || other.sgst == sgst)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,invoiceNumber,orderId,generatedAt,customerName,customerPhone,deliveryAddress,pharmacyName,pharmacyAddress,pharmacyPhone,pharmacyGSTIN,pharmacyLicense,const DeepCollectionEquality().hash(_items),subtotal,cgst,sgst,deliveryFee,total,notes);

@override
String toString() {
  return 'InvoiceEntity(invoiceNumber: $invoiceNumber, orderId: $orderId, generatedAt: $generatedAt, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, pharmacyName: $pharmacyName, pharmacyAddress: $pharmacyAddress, pharmacyPhone: $pharmacyPhone, pharmacyGSTIN: $pharmacyGSTIN, pharmacyLicense: $pharmacyLicense, items: $items, subtotal: $subtotal, cgst: $cgst, sgst: $sgst, deliveryFee: $deliveryFee, total: $total, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$InvoiceEntityCopyWith<$Res> implements $InvoiceEntityCopyWith<$Res> {
  factory _$InvoiceEntityCopyWith(_InvoiceEntity value, $Res Function(_InvoiceEntity) _then) = __$InvoiceEntityCopyWithImpl;
@override @useResult
$Res call({
 String invoiceNumber, String orderId, DateTime generatedAt, String customerName, String customerPhone, String deliveryAddress, String pharmacyName, String pharmacyAddress, String pharmacyPhone, String pharmacyGSTIN, String pharmacyLicense, List<InvoiceItemEntity> items, double subtotal, double cgst, double sgst, double deliveryFee, double total, String? notes
});




}
/// @nodoc
class __$InvoiceEntityCopyWithImpl<$Res>
    implements _$InvoiceEntityCopyWith<$Res> {
  __$InvoiceEntityCopyWithImpl(this._self, this._then);

  final _InvoiceEntity _self;
  final $Res Function(_InvoiceEntity) _then;

/// Create a copy of InvoiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoiceNumber = null,Object? orderId = null,Object? generatedAt = null,Object? customerName = null,Object? customerPhone = null,Object? deliveryAddress = null,Object? pharmacyName = null,Object? pharmacyAddress = null,Object? pharmacyPhone = null,Object? pharmacyGSTIN = null,Object? pharmacyLicense = null,Object? items = null,Object? subtotal = null,Object? cgst = null,Object? sgst = null,Object? deliveryFee = null,Object? total = null,Object? notes = freezed,}) {
  return _then(_InvoiceEntity(
invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: null == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String,deliveryAddress: null == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String,pharmacyName: null == pharmacyName ? _self.pharmacyName : pharmacyName // ignore: cast_nullable_to_non_nullable
as String,pharmacyAddress: null == pharmacyAddress ? _self.pharmacyAddress : pharmacyAddress // ignore: cast_nullable_to_non_nullable
as String,pharmacyPhone: null == pharmacyPhone ? _self.pharmacyPhone : pharmacyPhone // ignore: cast_nullable_to_non_nullable
as String,pharmacyGSTIN: null == pharmacyGSTIN ? _self.pharmacyGSTIN : pharmacyGSTIN // ignore: cast_nullable_to_non_nullable
as String,pharmacyLicense: null == pharmacyLicense ? _self.pharmacyLicense : pharmacyLicense // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceItemEntity>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,cgst: null == cgst ? _self.cgst : cgst // ignore: cast_nullable_to_non_nullable
as double,sgst: null == sgst ? _self.sgst : sgst // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$InvoiceItemEntity {

 String get name; int get quantity; double get unitPrice; double get total; bool? get isSubstitute;
/// Create a copy of InvoiceItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceItemEntityCopyWith<InvoiceItemEntity> get copyWith => _$InvoiceItemEntityCopyWithImpl<InvoiceItemEntity>(this as InvoiceItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceItemEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total)&&(identical(other.isSubstitute, isSubstitute) || other.isSubstitute == isSubstitute));
}


@override
int get hashCode => Object.hash(runtimeType,name,quantity,unitPrice,total,isSubstitute);

@override
String toString() {
  return 'InvoiceItemEntity(name: $name, quantity: $quantity, unitPrice: $unitPrice, total: $total, isSubstitute: $isSubstitute)';
}


}

/// @nodoc
abstract mixin class $InvoiceItemEntityCopyWith<$Res>  {
  factory $InvoiceItemEntityCopyWith(InvoiceItemEntity value, $Res Function(InvoiceItemEntity) _then) = _$InvoiceItemEntityCopyWithImpl;
@useResult
$Res call({
 String name, int quantity, double unitPrice, double total, bool? isSubstitute
});




}
/// @nodoc
class _$InvoiceItemEntityCopyWithImpl<$Res>
    implements $InvoiceItemEntityCopyWith<$Res> {
  _$InvoiceItemEntityCopyWithImpl(this._self, this._then);

  final InvoiceItemEntity _self;
  final $Res Function(InvoiceItemEntity) _then;

/// Create a copy of InvoiceItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? quantity = null,Object? unitPrice = null,Object? total = null,Object? isSubstitute = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,isSubstitute: freezed == isSubstitute ? _self.isSubstitute : isSubstitute // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceItemEntity].
extension InvoiceItemEntityPatterns on InvoiceItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int quantity,  double unitPrice,  double total,  bool? isSubstitute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceItemEntity() when $default != null:
return $default(_that.name,_that.quantity,_that.unitPrice,_that.total,_that.isSubstitute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int quantity,  double unitPrice,  double total,  bool? isSubstitute)  $default,) {final _that = this;
switch (_that) {
case _InvoiceItemEntity():
return $default(_that.name,_that.quantity,_that.unitPrice,_that.total,_that.isSubstitute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int quantity,  double unitPrice,  double total,  bool? isSubstitute)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceItemEntity() when $default != null:
return $default(_that.name,_that.quantity,_that.unitPrice,_that.total,_that.isSubstitute);case _:
  return null;

}
}

}

/// @nodoc


class _InvoiceItemEntity implements InvoiceItemEntity {
  const _InvoiceItemEntity({required this.name, required this.quantity, required this.unitPrice, required this.total, this.isSubstitute});
  

@override final  String name;
@override final  int quantity;
@override final  double unitPrice;
@override final  double total;
@override final  bool? isSubstitute;

/// Create a copy of InvoiceItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceItemEntityCopyWith<_InvoiceItemEntity> get copyWith => __$InvoiceItemEntityCopyWithImpl<_InvoiceItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceItemEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total)&&(identical(other.isSubstitute, isSubstitute) || other.isSubstitute == isSubstitute));
}


@override
int get hashCode => Object.hash(runtimeType,name,quantity,unitPrice,total,isSubstitute);

@override
String toString() {
  return 'InvoiceItemEntity(name: $name, quantity: $quantity, unitPrice: $unitPrice, total: $total, isSubstitute: $isSubstitute)';
}


}

/// @nodoc
abstract mixin class _$InvoiceItemEntityCopyWith<$Res> implements $InvoiceItemEntityCopyWith<$Res> {
  factory _$InvoiceItemEntityCopyWith(_InvoiceItemEntity value, $Res Function(_InvoiceItemEntity) _then) = __$InvoiceItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, int quantity, double unitPrice, double total, bool? isSubstitute
});




}
/// @nodoc
class __$InvoiceItemEntityCopyWithImpl<$Res>
    implements _$InvoiceItemEntityCopyWith<$Res> {
  __$InvoiceItemEntityCopyWithImpl(this._self, this._then);

  final _InvoiceItemEntity _self;
  final $Res Function(_InvoiceItemEntity) _then;

/// Create a copy of InvoiceItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? quantity = null,Object? unitPrice = null,Object? total = null,Object? isSubstitute = freezed,}) {
  return _then(_InvoiceItemEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,isSubstitute: freezed == isSubstitute ? _self.isSubstitute : isSubstitute // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
