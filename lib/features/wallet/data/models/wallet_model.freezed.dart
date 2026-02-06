// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletModel {

 String get pharmacyId; double get pendingBalance; double get availableBalance; double get totalWithdrawn; double get lifetimeEarnings; int get totalOrders; DateTime get lastUpdated;
/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletModelCopyWith<WalletModel> get copyWith => _$WalletModelCopyWithImpl<WalletModel>(this as WalletModel, _$identity);

  /// Serializes this WalletModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletModel&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.pendingBalance, pendingBalance) || other.pendingBalance == pendingBalance)&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.totalWithdrawn, totalWithdrawn) || other.totalWithdrawn == totalWithdrawn)&&(identical(other.lifetimeEarnings, lifetimeEarnings) || other.lifetimeEarnings == lifetimeEarnings)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pharmacyId,pendingBalance,availableBalance,totalWithdrawn,lifetimeEarnings,totalOrders,lastUpdated);

@override
String toString() {
  return 'WalletModel(pharmacyId: $pharmacyId, pendingBalance: $pendingBalance, availableBalance: $availableBalance, totalWithdrawn: $totalWithdrawn, lifetimeEarnings: $lifetimeEarnings, totalOrders: $totalOrders, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $WalletModelCopyWith<$Res>  {
  factory $WalletModelCopyWith(WalletModel value, $Res Function(WalletModel) _then) = _$WalletModelCopyWithImpl;
@useResult
$Res call({
 String pharmacyId, double pendingBalance, double availableBalance, double totalWithdrawn, double lifetimeEarnings, int totalOrders, DateTime lastUpdated
});




}
/// @nodoc
class _$WalletModelCopyWithImpl<$Res>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._self, this._then);

  final WalletModel _self;
  final $Res Function(WalletModel) _then;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pharmacyId = null,Object? pendingBalance = null,Object? availableBalance = null,Object? totalWithdrawn = null,Object? lifetimeEarnings = null,Object? totalOrders = null,Object? lastUpdated = null,}) {
  return _then(_self.copyWith(
pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,pendingBalance: null == pendingBalance ? _self.pendingBalance : pendingBalance // ignore: cast_nullable_to_non_nullable
as double,availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,totalWithdrawn: null == totalWithdrawn ? _self.totalWithdrawn : totalWithdrawn // ignore: cast_nullable_to_non_nullable
as double,lifetimeEarnings: null == lifetimeEarnings ? _self.lifetimeEarnings : lifetimeEarnings // ignore: cast_nullable_to_non_nullable
as double,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletModel].
extension WalletModelPatterns on WalletModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pharmacyId,  double pendingBalance,  double availableBalance,  double totalWithdrawn,  double lifetimeEarnings,  int totalOrders,  DateTime lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
return $default(_that.pharmacyId,_that.pendingBalance,_that.availableBalance,_that.totalWithdrawn,_that.lifetimeEarnings,_that.totalOrders,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pharmacyId,  double pendingBalance,  double availableBalance,  double totalWithdrawn,  double lifetimeEarnings,  int totalOrders,  DateTime lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _WalletModel():
return $default(_that.pharmacyId,_that.pendingBalance,_that.availableBalance,_that.totalWithdrawn,_that.lifetimeEarnings,_that.totalOrders,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pharmacyId,  double pendingBalance,  double availableBalance,  double totalWithdrawn,  double lifetimeEarnings,  int totalOrders,  DateTime lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
return $default(_that.pharmacyId,_that.pendingBalance,_that.availableBalance,_that.totalWithdrawn,_that.lifetimeEarnings,_that.totalOrders,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletModel extends WalletModel {
  const _WalletModel({required this.pharmacyId, required this.pendingBalance, required this.availableBalance, required this.totalWithdrawn, required this.lifetimeEarnings, required this.totalOrders, required this.lastUpdated}): super._();
  factory _WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);

@override final  String pharmacyId;
@override final  double pendingBalance;
@override final  double availableBalance;
@override final  double totalWithdrawn;
@override final  double lifetimeEarnings;
@override final  int totalOrders;
@override final  DateTime lastUpdated;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletModelCopyWith<_WalletModel> get copyWith => __$WalletModelCopyWithImpl<_WalletModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletModel&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.pendingBalance, pendingBalance) || other.pendingBalance == pendingBalance)&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.totalWithdrawn, totalWithdrawn) || other.totalWithdrawn == totalWithdrawn)&&(identical(other.lifetimeEarnings, lifetimeEarnings) || other.lifetimeEarnings == lifetimeEarnings)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pharmacyId,pendingBalance,availableBalance,totalWithdrawn,lifetimeEarnings,totalOrders,lastUpdated);

@override
String toString() {
  return 'WalletModel(pharmacyId: $pharmacyId, pendingBalance: $pendingBalance, availableBalance: $availableBalance, totalWithdrawn: $totalWithdrawn, lifetimeEarnings: $lifetimeEarnings, totalOrders: $totalOrders, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$WalletModelCopyWith<$Res> implements $WalletModelCopyWith<$Res> {
  factory _$WalletModelCopyWith(_WalletModel value, $Res Function(_WalletModel) _then) = __$WalletModelCopyWithImpl;
@override @useResult
$Res call({
 String pharmacyId, double pendingBalance, double availableBalance, double totalWithdrawn, double lifetimeEarnings, int totalOrders, DateTime lastUpdated
});




}
/// @nodoc
class __$WalletModelCopyWithImpl<$Res>
    implements _$WalletModelCopyWith<$Res> {
  __$WalletModelCopyWithImpl(this._self, this._then);

  final _WalletModel _self;
  final $Res Function(_WalletModel) _then;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pharmacyId = null,Object? pendingBalance = null,Object? availableBalance = null,Object? totalWithdrawn = null,Object? lifetimeEarnings = null,Object? totalOrders = null,Object? lastUpdated = null,}) {
  return _then(_WalletModel(
pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,pendingBalance: null == pendingBalance ? _self.pendingBalance : pendingBalance // ignore: cast_nullable_to_non_nullable
as double,availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,totalWithdrawn: null == totalWithdrawn ? _self.totalWithdrawn : totalWithdrawn // ignore: cast_nullable_to_non_nullable
as double,lifetimeEarnings: null == lifetimeEarnings ? _self.lifetimeEarnings : lifetimeEarnings // ignore: cast_nullable_to_non_nullable
as double,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
