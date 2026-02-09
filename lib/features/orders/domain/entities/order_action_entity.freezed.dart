// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_action_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderActionEntity {

 String get orderId;
/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderActionEntityCopyWith<OrderActionEntity> get copyWith => _$OrderActionEntityCopyWithImpl<OrderActionEntity>(this as OrderActionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderActionEntity&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'OrderActionEntity(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $OrderActionEntityCopyWith<$Res>  {
  factory $OrderActionEntityCopyWith(OrderActionEntity value, $Res Function(OrderActionEntity) _then) = _$OrderActionEntityCopyWithImpl;
@useResult
$Res call({
 String orderId
});




}
/// @nodoc
class _$OrderActionEntityCopyWithImpl<$Res>
    implements $OrderActionEntityCopyWith<$Res> {
  _$OrderActionEntityCopyWithImpl(this._self, this._then);

  final OrderActionEntity _self;
  final $Res Function(OrderActionEntity) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderActionEntity].
extension OrderActionEntityPatterns on OrderActionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AcceptOrderAction value)?  accept,TResult Function( RejectOrderAction value)?  reject,TResult Function( PartialAcceptOrderAction value)?  partialAccept,TResult Function( GenerateInvoiceAction value)?  generateInvoice,TResult Function( GenerateQRAction value)?  generateQR,TResult Function( MarkReadyAction value)?  markReady,TResult Function( ConfirmPickupAction value)?  confirmPickup,TResult Function( UpdateLocationAction value)?  updateLocation,TResult Function( MarkDeliveredAction value)?  markDelivered,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AcceptOrderAction() when accept != null:
return accept(_that);case RejectOrderAction() when reject != null:
return reject(_that);case PartialAcceptOrderAction() when partialAccept != null:
return partialAccept(_that);case GenerateInvoiceAction() when generateInvoice != null:
return generateInvoice(_that);case GenerateQRAction() when generateQR != null:
return generateQR(_that);case MarkReadyAction() when markReady != null:
return markReady(_that);case ConfirmPickupAction() when confirmPickup != null:
return confirmPickup(_that);case UpdateLocationAction() when updateLocation != null:
return updateLocation(_that);case MarkDeliveredAction() when markDelivered != null:
return markDelivered(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AcceptOrderAction value)  accept,required TResult Function( RejectOrderAction value)  reject,required TResult Function( PartialAcceptOrderAction value)  partialAccept,required TResult Function( GenerateInvoiceAction value)  generateInvoice,required TResult Function( GenerateQRAction value)  generateQR,required TResult Function( MarkReadyAction value)  markReady,required TResult Function( ConfirmPickupAction value)  confirmPickup,required TResult Function( UpdateLocationAction value)  updateLocation,required TResult Function( MarkDeliveredAction value)  markDelivered,}){
final _that = this;
switch (_that) {
case AcceptOrderAction():
return accept(_that);case RejectOrderAction():
return reject(_that);case PartialAcceptOrderAction():
return partialAccept(_that);case GenerateInvoiceAction():
return generateInvoice(_that);case GenerateQRAction():
return generateQR(_that);case MarkReadyAction():
return markReady(_that);case ConfirmPickupAction():
return confirmPickup(_that);case UpdateLocationAction():
return updateLocation(_that);case MarkDeliveredAction():
return markDelivered(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AcceptOrderAction value)?  accept,TResult? Function( RejectOrderAction value)?  reject,TResult? Function( PartialAcceptOrderAction value)?  partialAccept,TResult? Function( GenerateInvoiceAction value)?  generateInvoice,TResult? Function( GenerateQRAction value)?  generateQR,TResult? Function( MarkReadyAction value)?  markReady,TResult? Function( ConfirmPickupAction value)?  confirmPickup,TResult? Function( UpdateLocationAction value)?  updateLocation,TResult? Function( MarkDeliveredAction value)?  markDelivered,}){
final _that = this;
switch (_that) {
case AcceptOrderAction() when accept != null:
return accept(_that);case RejectOrderAction() when reject != null:
return reject(_that);case PartialAcceptOrderAction() when partialAccept != null:
return partialAccept(_that);case GenerateInvoiceAction() when generateInvoice != null:
return generateInvoice(_that);case GenerateQRAction() when generateQR != null:
return generateQR(_that);case MarkReadyAction() when markReady != null:
return markReady(_that);case ConfirmPickupAction() when confirmPickup != null:
return confirmPickup(_that);case UpdateLocationAction() when updateLocation != null:
return updateLocation(_that);case MarkDeliveredAction() when markDelivered != null:
return markDelivered(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String orderId,  List<OrderItemEntity> items,  String? notes)?  accept,TResult Function( String orderId,  String reason)?  reject,TResult Function( String orderId,  List<OrderItemEntity> availableItems,  List<OrderItemEntity> unavailableItems,  String? notes)?  partialAccept,TResult Function( String orderId)?  generateInvoice,TResult Function( String orderId)?  generateQR,TResult Function( String orderId)?  markReady,TResult Function( String orderId,  String qrData)?  confirmPickup,TResult Function( String orderId,  double lat,  double lng)?  updateLocation,TResult Function( String orderId)?  markDelivered,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AcceptOrderAction() when accept != null:
return accept(_that.orderId,_that.items,_that.notes);case RejectOrderAction() when reject != null:
return reject(_that.orderId,_that.reason);case PartialAcceptOrderAction() when partialAccept != null:
return partialAccept(_that.orderId,_that.availableItems,_that.unavailableItems,_that.notes);case GenerateInvoiceAction() when generateInvoice != null:
return generateInvoice(_that.orderId);case GenerateQRAction() when generateQR != null:
return generateQR(_that.orderId);case MarkReadyAction() when markReady != null:
return markReady(_that.orderId);case ConfirmPickupAction() when confirmPickup != null:
return confirmPickup(_that.orderId,_that.qrData);case UpdateLocationAction() when updateLocation != null:
return updateLocation(_that.orderId,_that.lat,_that.lng);case MarkDeliveredAction() when markDelivered != null:
return markDelivered(_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String orderId,  List<OrderItemEntity> items,  String? notes)  accept,required TResult Function( String orderId,  String reason)  reject,required TResult Function( String orderId,  List<OrderItemEntity> availableItems,  List<OrderItemEntity> unavailableItems,  String? notes)  partialAccept,required TResult Function( String orderId)  generateInvoice,required TResult Function( String orderId)  generateQR,required TResult Function( String orderId)  markReady,required TResult Function( String orderId,  String qrData)  confirmPickup,required TResult Function( String orderId,  double lat,  double lng)  updateLocation,required TResult Function( String orderId)  markDelivered,}) {final _that = this;
switch (_that) {
case AcceptOrderAction():
return accept(_that.orderId,_that.items,_that.notes);case RejectOrderAction():
return reject(_that.orderId,_that.reason);case PartialAcceptOrderAction():
return partialAccept(_that.orderId,_that.availableItems,_that.unavailableItems,_that.notes);case GenerateInvoiceAction():
return generateInvoice(_that.orderId);case GenerateQRAction():
return generateQR(_that.orderId);case MarkReadyAction():
return markReady(_that.orderId);case ConfirmPickupAction():
return confirmPickup(_that.orderId,_that.qrData);case UpdateLocationAction():
return updateLocation(_that.orderId,_that.lat,_that.lng);case MarkDeliveredAction():
return markDelivered(_that.orderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String orderId,  List<OrderItemEntity> items,  String? notes)?  accept,TResult? Function( String orderId,  String reason)?  reject,TResult? Function( String orderId,  List<OrderItemEntity> availableItems,  List<OrderItemEntity> unavailableItems,  String? notes)?  partialAccept,TResult? Function( String orderId)?  generateInvoice,TResult? Function( String orderId)?  generateQR,TResult? Function( String orderId)?  markReady,TResult? Function( String orderId,  String qrData)?  confirmPickup,TResult? Function( String orderId,  double lat,  double lng)?  updateLocation,TResult? Function( String orderId)?  markDelivered,}) {final _that = this;
switch (_that) {
case AcceptOrderAction() when accept != null:
return accept(_that.orderId,_that.items,_that.notes);case RejectOrderAction() when reject != null:
return reject(_that.orderId,_that.reason);case PartialAcceptOrderAction() when partialAccept != null:
return partialAccept(_that.orderId,_that.availableItems,_that.unavailableItems,_that.notes);case GenerateInvoiceAction() when generateInvoice != null:
return generateInvoice(_that.orderId);case GenerateQRAction() when generateQR != null:
return generateQR(_that.orderId);case MarkReadyAction() when markReady != null:
return markReady(_that.orderId);case ConfirmPickupAction() when confirmPickup != null:
return confirmPickup(_that.orderId,_that.qrData);case UpdateLocationAction() when updateLocation != null:
return updateLocation(_that.orderId,_that.lat,_that.lng);case MarkDeliveredAction() when markDelivered != null:
return markDelivered(_that.orderId);case _:
  return null;

}
}

}

/// @nodoc


class AcceptOrderAction implements OrderActionEntity {
  const AcceptOrderAction({required this.orderId, required final  List<OrderItemEntity> items, this.notes}): _items = items;
  

@override final  String orderId;
 final  List<OrderItemEntity> _items;
 List<OrderItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  String? notes;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptOrderActionCopyWith<AcceptOrderAction> get copyWith => _$AcceptOrderActionCopyWithImpl<AcceptOrderAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptOrderAction&&(identical(other.orderId, orderId) || other.orderId == orderId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,const DeepCollectionEquality().hash(_items),notes);

@override
String toString() {
  return 'OrderActionEntity.accept(orderId: $orderId, items: $items, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $AcceptOrderActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $AcceptOrderActionCopyWith(AcceptOrderAction value, $Res Function(AcceptOrderAction) _then) = _$AcceptOrderActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId, List<OrderItemEntity> items, String? notes
});




}
/// @nodoc
class _$AcceptOrderActionCopyWithImpl<$Res>
    implements $AcceptOrderActionCopyWith<$Res> {
  _$AcceptOrderActionCopyWithImpl(this._self, this._then);

  final AcceptOrderAction _self;
  final $Res Function(AcceptOrderAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? items = null,Object? notes = freezed,}) {
  return _then(AcceptOrderAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RejectOrderAction implements OrderActionEntity {
  const RejectOrderAction({required this.orderId, required this.reason});
  

@override final  String orderId;
 final  String reason;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectOrderActionCopyWith<RejectOrderAction> get copyWith => _$RejectOrderActionCopyWithImpl<RejectOrderAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectOrderAction&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,reason);

@override
String toString() {
  return 'OrderActionEntity.reject(orderId: $orderId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $RejectOrderActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $RejectOrderActionCopyWith(RejectOrderAction value, $Res Function(RejectOrderAction) _then) = _$RejectOrderActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String reason
});




}
/// @nodoc
class _$RejectOrderActionCopyWithImpl<$Res>
    implements $RejectOrderActionCopyWith<$Res> {
  _$RejectOrderActionCopyWithImpl(this._self, this._then);

  final RejectOrderAction _self;
  final $Res Function(RejectOrderAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? reason = null,}) {
  return _then(RejectOrderAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PartialAcceptOrderAction implements OrderActionEntity {
  const PartialAcceptOrderAction({required this.orderId, required final  List<OrderItemEntity> availableItems, required final  List<OrderItemEntity> unavailableItems, this.notes}): _availableItems = availableItems,_unavailableItems = unavailableItems;
  

@override final  String orderId;
 final  List<OrderItemEntity> _availableItems;
 List<OrderItemEntity> get availableItems {
  if (_availableItems is EqualUnmodifiableListView) return _availableItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableItems);
}

 final  List<OrderItemEntity> _unavailableItems;
 List<OrderItemEntity> get unavailableItems {
  if (_unavailableItems is EqualUnmodifiableListView) return _unavailableItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unavailableItems);
}

 final  String? notes;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartialAcceptOrderActionCopyWith<PartialAcceptOrderAction> get copyWith => _$PartialAcceptOrderActionCopyWithImpl<PartialAcceptOrderAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartialAcceptOrderAction&&(identical(other.orderId, orderId) || other.orderId == orderId)&&const DeepCollectionEquality().equals(other._availableItems, _availableItems)&&const DeepCollectionEquality().equals(other._unavailableItems, _unavailableItems)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,const DeepCollectionEquality().hash(_availableItems),const DeepCollectionEquality().hash(_unavailableItems),notes);

@override
String toString() {
  return 'OrderActionEntity.partialAccept(orderId: $orderId, availableItems: $availableItems, unavailableItems: $unavailableItems, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $PartialAcceptOrderActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $PartialAcceptOrderActionCopyWith(PartialAcceptOrderAction value, $Res Function(PartialAcceptOrderAction) _then) = _$PartialAcceptOrderActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId, List<OrderItemEntity> availableItems, List<OrderItemEntity> unavailableItems, String? notes
});




}
/// @nodoc
class _$PartialAcceptOrderActionCopyWithImpl<$Res>
    implements $PartialAcceptOrderActionCopyWith<$Res> {
  _$PartialAcceptOrderActionCopyWithImpl(this._self, this._then);

  final PartialAcceptOrderAction _self;
  final $Res Function(PartialAcceptOrderAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? availableItems = null,Object? unavailableItems = null,Object? notes = freezed,}) {
  return _then(PartialAcceptOrderAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,availableItems: null == availableItems ? _self._availableItems : availableItems // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,unavailableItems: null == unavailableItems ? _self._unavailableItems : unavailableItems // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class GenerateInvoiceAction implements OrderActionEntity {
  const GenerateInvoiceAction({required this.orderId});
  

@override final  String orderId;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateInvoiceActionCopyWith<GenerateInvoiceAction> get copyWith => _$GenerateInvoiceActionCopyWithImpl<GenerateInvoiceAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateInvoiceAction&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'OrderActionEntity.generateInvoice(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $GenerateInvoiceActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $GenerateInvoiceActionCopyWith(GenerateInvoiceAction value, $Res Function(GenerateInvoiceAction) _then) = _$GenerateInvoiceActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId
});




}
/// @nodoc
class _$GenerateInvoiceActionCopyWithImpl<$Res>
    implements $GenerateInvoiceActionCopyWith<$Res> {
  _$GenerateInvoiceActionCopyWithImpl(this._self, this._then);

  final GenerateInvoiceAction _self;
  final $Res Function(GenerateInvoiceAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(GenerateInvoiceAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GenerateQRAction implements OrderActionEntity {
  const GenerateQRAction({required this.orderId});
  

@override final  String orderId;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateQRActionCopyWith<GenerateQRAction> get copyWith => _$GenerateQRActionCopyWithImpl<GenerateQRAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateQRAction&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'OrderActionEntity.generateQR(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $GenerateQRActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $GenerateQRActionCopyWith(GenerateQRAction value, $Res Function(GenerateQRAction) _then) = _$GenerateQRActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId
});




}
/// @nodoc
class _$GenerateQRActionCopyWithImpl<$Res>
    implements $GenerateQRActionCopyWith<$Res> {
  _$GenerateQRActionCopyWithImpl(this._self, this._then);

  final GenerateQRAction _self;
  final $Res Function(GenerateQRAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(GenerateQRAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MarkReadyAction implements OrderActionEntity {
  const MarkReadyAction({required this.orderId});
  

@override final  String orderId;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkReadyActionCopyWith<MarkReadyAction> get copyWith => _$MarkReadyActionCopyWithImpl<MarkReadyAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkReadyAction&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'OrderActionEntity.markReady(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $MarkReadyActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $MarkReadyActionCopyWith(MarkReadyAction value, $Res Function(MarkReadyAction) _then) = _$MarkReadyActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId
});




}
/// @nodoc
class _$MarkReadyActionCopyWithImpl<$Res>
    implements $MarkReadyActionCopyWith<$Res> {
  _$MarkReadyActionCopyWithImpl(this._self, this._then);

  final MarkReadyAction _self;
  final $Res Function(MarkReadyAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(MarkReadyAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfirmPickupAction implements OrderActionEntity {
  const ConfirmPickupAction({required this.orderId, required this.qrData});
  

@override final  String orderId;
 final  String qrData;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmPickupActionCopyWith<ConfirmPickupAction> get copyWith => _$ConfirmPickupActionCopyWithImpl<ConfirmPickupAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmPickupAction&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.qrData, qrData) || other.qrData == qrData));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,qrData);

@override
String toString() {
  return 'OrderActionEntity.confirmPickup(orderId: $orderId, qrData: $qrData)';
}


}

/// @nodoc
abstract mixin class $ConfirmPickupActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $ConfirmPickupActionCopyWith(ConfirmPickupAction value, $Res Function(ConfirmPickupAction) _then) = _$ConfirmPickupActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String qrData
});




}
/// @nodoc
class _$ConfirmPickupActionCopyWithImpl<$Res>
    implements $ConfirmPickupActionCopyWith<$Res> {
  _$ConfirmPickupActionCopyWithImpl(this._self, this._then);

  final ConfirmPickupAction _self;
  final $Res Function(ConfirmPickupAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? qrData = null,}) {
  return _then(ConfirmPickupAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,qrData: null == qrData ? _self.qrData : qrData // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateLocationAction implements OrderActionEntity {
  const UpdateLocationAction({required this.orderId, required this.lat, required this.lng});
  

@override final  String orderId;
 final  double lat;
 final  double lng;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLocationActionCopyWith<UpdateLocationAction> get copyWith => _$UpdateLocationActionCopyWithImpl<UpdateLocationAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLocationAction&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,lat,lng);

@override
String toString() {
  return 'OrderActionEntity.updateLocation(orderId: $orderId, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $UpdateLocationActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $UpdateLocationActionCopyWith(UpdateLocationAction value, $Res Function(UpdateLocationAction) _then) = _$UpdateLocationActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId, double lat, double lng
});




}
/// @nodoc
class _$UpdateLocationActionCopyWithImpl<$Res>
    implements $UpdateLocationActionCopyWith<$Res> {
  _$UpdateLocationActionCopyWithImpl(this._self, this._then);

  final UpdateLocationAction _self;
  final $Res Function(UpdateLocationAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? lat = null,Object? lng = null,}) {
  return _then(UpdateLocationAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class MarkDeliveredAction implements OrderActionEntity {
  const MarkDeliveredAction({required this.orderId});
  

@override final  String orderId;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkDeliveredActionCopyWith<MarkDeliveredAction> get copyWith => _$MarkDeliveredActionCopyWithImpl<MarkDeliveredAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkDeliveredAction&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'OrderActionEntity.markDelivered(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $MarkDeliveredActionCopyWith<$Res> implements $OrderActionEntityCopyWith<$Res> {
  factory $MarkDeliveredActionCopyWith(MarkDeliveredAction value, $Res Function(MarkDeliveredAction) _then) = _$MarkDeliveredActionCopyWithImpl;
@override @useResult
$Res call({
 String orderId
});




}
/// @nodoc
class _$MarkDeliveredActionCopyWithImpl<$Res>
    implements $MarkDeliveredActionCopyWith<$Res> {
  _$MarkDeliveredActionCopyWithImpl(this._self, this._then);

  final MarkDeliveredAction _self;
  final $Res Function(MarkDeliveredAction) _then;

/// Create a copy of OrderActionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(MarkDeliveredAction(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
