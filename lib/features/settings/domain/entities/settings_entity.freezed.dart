// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEntity {

 ThemeMode get themeMode; Language get language; bool get notificationsEnabled; bool get orderAlertsEnabled; bool get lowStockAlertsEnabled; bool get expiryAlertsEnabled; bool get soundEnabled; bool get vibrationEnabled; bool get autoAcceptOrders; double get orderRadius;
/// Create a copy of SettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsEntityCopyWith<SettingsEntity> get copyWith => _$SettingsEntityCopyWithImpl<SettingsEntity>(this as SettingsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEntity&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.language, language) || other.language == language)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.orderAlertsEnabled, orderAlertsEnabled) || other.orderAlertsEnabled == orderAlertsEnabled)&&(identical(other.lowStockAlertsEnabled, lowStockAlertsEnabled) || other.lowStockAlertsEnabled == lowStockAlertsEnabled)&&(identical(other.expiryAlertsEnabled, expiryAlertsEnabled) || other.expiryAlertsEnabled == expiryAlertsEnabled)&&(identical(other.soundEnabled, soundEnabled) || other.soundEnabled == soundEnabled)&&(identical(other.vibrationEnabled, vibrationEnabled) || other.vibrationEnabled == vibrationEnabled)&&(identical(other.autoAcceptOrders, autoAcceptOrders) || other.autoAcceptOrders == autoAcceptOrders)&&(identical(other.orderRadius, orderRadius) || other.orderRadius == orderRadius));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,language,notificationsEnabled,orderAlertsEnabled,lowStockAlertsEnabled,expiryAlertsEnabled,soundEnabled,vibrationEnabled,autoAcceptOrders,orderRadius);

@override
String toString() {
  return 'SettingsEntity(themeMode: $themeMode, language: $language, notificationsEnabled: $notificationsEnabled, orderAlertsEnabled: $orderAlertsEnabled, lowStockAlertsEnabled: $lowStockAlertsEnabled, expiryAlertsEnabled: $expiryAlertsEnabled, soundEnabled: $soundEnabled, vibrationEnabled: $vibrationEnabled, autoAcceptOrders: $autoAcceptOrders, orderRadius: $orderRadius)';
}


}

/// @nodoc
abstract mixin class $SettingsEntityCopyWith<$Res>  {
  factory $SettingsEntityCopyWith(SettingsEntity value, $Res Function(SettingsEntity) _then) = _$SettingsEntityCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, Language language, bool notificationsEnabled, bool orderAlertsEnabled, bool lowStockAlertsEnabled, bool expiryAlertsEnabled, bool soundEnabled, bool vibrationEnabled, bool autoAcceptOrders, double orderRadius
});




}
/// @nodoc
class _$SettingsEntityCopyWithImpl<$Res>
    implements $SettingsEntityCopyWith<$Res> {
  _$SettingsEntityCopyWithImpl(this._self, this._then);

  final SettingsEntity _self;
  final $Res Function(SettingsEntity) _then;

/// Create a copy of SettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? language = null,Object? notificationsEnabled = null,Object? orderAlertsEnabled = null,Object? lowStockAlertsEnabled = null,Object? expiryAlertsEnabled = null,Object? soundEnabled = null,Object? vibrationEnabled = null,Object? autoAcceptOrders = null,Object? orderRadius = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,orderAlertsEnabled: null == orderAlertsEnabled ? _self.orderAlertsEnabled : orderAlertsEnabled // ignore: cast_nullable_to_non_nullable
as bool,lowStockAlertsEnabled: null == lowStockAlertsEnabled ? _self.lowStockAlertsEnabled : lowStockAlertsEnabled // ignore: cast_nullable_to_non_nullable
as bool,expiryAlertsEnabled: null == expiryAlertsEnabled ? _self.expiryAlertsEnabled : expiryAlertsEnabled // ignore: cast_nullable_to_non_nullable
as bool,soundEnabled: null == soundEnabled ? _self.soundEnabled : soundEnabled // ignore: cast_nullable_to_non_nullable
as bool,vibrationEnabled: null == vibrationEnabled ? _self.vibrationEnabled : vibrationEnabled // ignore: cast_nullable_to_non_nullable
as bool,autoAcceptOrders: null == autoAcceptOrders ? _self.autoAcceptOrders : autoAcceptOrders // ignore: cast_nullable_to_non_nullable
as bool,orderRadius: null == orderRadius ? _self.orderRadius : orderRadius // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsEntity].
extension SettingsEntityPatterns on SettingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _SettingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  Language language,  bool notificationsEnabled,  bool orderAlertsEnabled,  bool lowStockAlertsEnabled,  bool expiryAlertsEnabled,  bool soundEnabled,  bool vibrationEnabled,  bool autoAcceptOrders,  double orderRadius)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsEntity() when $default != null:
return $default(_that.themeMode,_that.language,_that.notificationsEnabled,_that.orderAlertsEnabled,_that.lowStockAlertsEnabled,_that.expiryAlertsEnabled,_that.soundEnabled,_that.vibrationEnabled,_that.autoAcceptOrders,_that.orderRadius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  Language language,  bool notificationsEnabled,  bool orderAlertsEnabled,  bool lowStockAlertsEnabled,  bool expiryAlertsEnabled,  bool soundEnabled,  bool vibrationEnabled,  bool autoAcceptOrders,  double orderRadius)  $default,) {final _that = this;
switch (_that) {
case _SettingsEntity():
return $default(_that.themeMode,_that.language,_that.notificationsEnabled,_that.orderAlertsEnabled,_that.lowStockAlertsEnabled,_that.expiryAlertsEnabled,_that.soundEnabled,_that.vibrationEnabled,_that.autoAcceptOrders,_that.orderRadius);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  Language language,  bool notificationsEnabled,  bool orderAlertsEnabled,  bool lowStockAlertsEnabled,  bool expiryAlertsEnabled,  bool soundEnabled,  bool vibrationEnabled,  bool autoAcceptOrders,  double orderRadius)?  $default,) {final _that = this;
switch (_that) {
case _SettingsEntity() when $default != null:
return $default(_that.themeMode,_that.language,_that.notificationsEnabled,_that.orderAlertsEnabled,_that.lowStockAlertsEnabled,_that.expiryAlertsEnabled,_that.soundEnabled,_that.vibrationEnabled,_that.autoAcceptOrders,_that.orderRadius);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsEntity implements SettingsEntity {
  const _SettingsEntity({required this.themeMode, required this.language, required this.notificationsEnabled, required this.orderAlertsEnabled, required this.lowStockAlertsEnabled, required this.expiryAlertsEnabled, required this.soundEnabled, required this.vibrationEnabled, required this.autoAcceptOrders, required this.orderRadius});
  

@override final  ThemeMode themeMode;
@override final  Language language;
@override final  bool notificationsEnabled;
@override final  bool orderAlertsEnabled;
@override final  bool lowStockAlertsEnabled;
@override final  bool expiryAlertsEnabled;
@override final  bool soundEnabled;
@override final  bool vibrationEnabled;
@override final  bool autoAcceptOrders;
@override final  double orderRadius;

/// Create a copy of SettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsEntityCopyWith<_SettingsEntity> get copyWith => __$SettingsEntityCopyWithImpl<_SettingsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsEntity&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.language, language) || other.language == language)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.orderAlertsEnabled, orderAlertsEnabled) || other.orderAlertsEnabled == orderAlertsEnabled)&&(identical(other.lowStockAlertsEnabled, lowStockAlertsEnabled) || other.lowStockAlertsEnabled == lowStockAlertsEnabled)&&(identical(other.expiryAlertsEnabled, expiryAlertsEnabled) || other.expiryAlertsEnabled == expiryAlertsEnabled)&&(identical(other.soundEnabled, soundEnabled) || other.soundEnabled == soundEnabled)&&(identical(other.vibrationEnabled, vibrationEnabled) || other.vibrationEnabled == vibrationEnabled)&&(identical(other.autoAcceptOrders, autoAcceptOrders) || other.autoAcceptOrders == autoAcceptOrders)&&(identical(other.orderRadius, orderRadius) || other.orderRadius == orderRadius));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,language,notificationsEnabled,orderAlertsEnabled,lowStockAlertsEnabled,expiryAlertsEnabled,soundEnabled,vibrationEnabled,autoAcceptOrders,orderRadius);

@override
String toString() {
  return 'SettingsEntity(themeMode: $themeMode, language: $language, notificationsEnabled: $notificationsEnabled, orderAlertsEnabled: $orderAlertsEnabled, lowStockAlertsEnabled: $lowStockAlertsEnabled, expiryAlertsEnabled: $expiryAlertsEnabled, soundEnabled: $soundEnabled, vibrationEnabled: $vibrationEnabled, autoAcceptOrders: $autoAcceptOrders, orderRadius: $orderRadius)';
}


}

/// @nodoc
abstract mixin class _$SettingsEntityCopyWith<$Res> implements $SettingsEntityCopyWith<$Res> {
  factory _$SettingsEntityCopyWith(_SettingsEntity value, $Res Function(_SettingsEntity) _then) = __$SettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, Language language, bool notificationsEnabled, bool orderAlertsEnabled, bool lowStockAlertsEnabled, bool expiryAlertsEnabled, bool soundEnabled, bool vibrationEnabled, bool autoAcceptOrders, double orderRadius
});




}
/// @nodoc
class __$SettingsEntityCopyWithImpl<$Res>
    implements _$SettingsEntityCopyWith<$Res> {
  __$SettingsEntityCopyWithImpl(this._self, this._then);

  final _SettingsEntity _self;
  final $Res Function(_SettingsEntity) _then;

/// Create a copy of SettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? language = null,Object? notificationsEnabled = null,Object? orderAlertsEnabled = null,Object? lowStockAlertsEnabled = null,Object? expiryAlertsEnabled = null,Object? soundEnabled = null,Object? vibrationEnabled = null,Object? autoAcceptOrders = null,Object? orderRadius = null,}) {
  return _then(_SettingsEntity(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,orderAlertsEnabled: null == orderAlertsEnabled ? _self.orderAlertsEnabled : orderAlertsEnabled // ignore: cast_nullable_to_non_nullable
as bool,lowStockAlertsEnabled: null == lowStockAlertsEnabled ? _self.lowStockAlertsEnabled : lowStockAlertsEnabled // ignore: cast_nullable_to_non_nullable
as bool,expiryAlertsEnabled: null == expiryAlertsEnabled ? _self.expiryAlertsEnabled : expiryAlertsEnabled // ignore: cast_nullable_to_non_nullable
as bool,soundEnabled: null == soundEnabled ? _self.soundEnabled : soundEnabled // ignore: cast_nullable_to_non_nullable
as bool,vibrationEnabled: null == vibrationEnabled ? _self.vibrationEnabled : vibrationEnabled // ignore: cast_nullable_to_non_nullable
as bool,autoAcceptOrders: null == autoAcceptOrders ? _self.autoAcceptOrders : autoAcceptOrders // ignore: cast_nullable_to_non_nullable
as bool,orderRadius: null == orderRadius ? _self.orderRadius : orderRadius // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
