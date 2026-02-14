// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StaffEntity {

 String get id; String get name; String get email; String get pharmacyId; RoleEntity get role; String? get phoneNumber; String? get photoUrl; DateTime get createdAt; DateTime? get lastLoginAt; bool get isActive;
/// Create a copy of StaffEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffEntityCopyWith<StaffEntity> get copyWith => _$StaffEntityCopyWithImpl<StaffEntity>(this as StaffEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.role, role) || other.role == role)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email,pharmacyId,role,phoneNumber,photoUrl,createdAt,lastLoginAt,isActive);

@override
String toString() {
  return 'StaffEntity(id: $id, name: $name, email: $email, pharmacyId: $pharmacyId, role: $role, phoneNumber: $phoneNumber, photoUrl: $photoUrl, createdAt: $createdAt, lastLoginAt: $lastLoginAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $StaffEntityCopyWith<$Res>  {
  factory $StaffEntityCopyWith(StaffEntity value, $Res Function(StaffEntity) _then) = _$StaffEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String pharmacyId, RoleEntity role, String? phoneNumber, String? photoUrl, DateTime createdAt, DateTime? lastLoginAt, bool isActive
});


$RoleEntityCopyWith<$Res> get role;

}
/// @nodoc
class _$StaffEntityCopyWithImpl<$Res>
    implements $StaffEntityCopyWith<$Res> {
  _$StaffEntityCopyWithImpl(this._self, this._then);

  final StaffEntity _self;
  final $Res Function(StaffEntity) _then;

/// Create a copy of StaffEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? pharmacyId = null,Object? role = null,Object? phoneNumber = freezed,Object? photoUrl = freezed,Object? createdAt = null,Object? lastLoginAt = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RoleEntity,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of StaffEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoleEntityCopyWith<$Res> get role {
  
  return $RoleEntityCopyWith<$Res>(_self.role, (value) {
    return _then(_self.copyWith(role: value));
  });
}
}


/// Adds pattern-matching-related methods to [StaffEntity].
extension StaffEntityPatterns on StaffEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffEntity value)  $default,){
final _that = this;
switch (_that) {
case _StaffEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StaffEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String pharmacyId,  RoleEntity role,  String? phoneNumber,  String? photoUrl,  DateTime createdAt,  DateTime? lastLoginAt,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.pharmacyId,_that.role,_that.phoneNumber,_that.photoUrl,_that.createdAt,_that.lastLoginAt,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String pharmacyId,  RoleEntity role,  String? phoneNumber,  String? photoUrl,  DateTime createdAt,  DateTime? lastLoginAt,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _StaffEntity():
return $default(_that.id,_that.name,_that.email,_that.pharmacyId,_that.role,_that.phoneNumber,_that.photoUrl,_that.createdAt,_that.lastLoginAt,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String pharmacyId,  RoleEntity role,  String? phoneNumber,  String? photoUrl,  DateTime createdAt,  DateTime? lastLoginAt,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _StaffEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.pharmacyId,_that.role,_that.phoneNumber,_that.photoUrl,_that.createdAt,_that.lastLoginAt,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _StaffEntity implements StaffEntity {
  const _StaffEntity({required this.id, required this.name, required this.email, required this.pharmacyId, required this.role, this.phoneNumber, this.photoUrl, required this.createdAt, this.lastLoginAt, this.isActive = true});
  

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String pharmacyId;
@override final  RoleEntity role;
@override final  String? phoneNumber;
@override final  String? photoUrl;
@override final  DateTime createdAt;
@override final  DateTime? lastLoginAt;
@override@JsonKey() final  bool isActive;

/// Create a copy of StaffEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffEntityCopyWith<_StaffEntity> get copyWith => __$StaffEntityCopyWithImpl<_StaffEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.role, role) || other.role == role)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email,pharmacyId,role,phoneNumber,photoUrl,createdAt,lastLoginAt,isActive);

@override
String toString() {
  return 'StaffEntity(id: $id, name: $name, email: $email, pharmacyId: $pharmacyId, role: $role, phoneNumber: $phoneNumber, photoUrl: $photoUrl, createdAt: $createdAt, lastLoginAt: $lastLoginAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$StaffEntityCopyWith<$Res> implements $StaffEntityCopyWith<$Res> {
  factory _$StaffEntityCopyWith(_StaffEntity value, $Res Function(_StaffEntity) _then) = __$StaffEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String pharmacyId, RoleEntity role, String? phoneNumber, String? photoUrl, DateTime createdAt, DateTime? lastLoginAt, bool isActive
});


@override $RoleEntityCopyWith<$Res> get role;

}
/// @nodoc
class __$StaffEntityCopyWithImpl<$Res>
    implements _$StaffEntityCopyWith<$Res> {
  __$StaffEntityCopyWithImpl(this._self, this._then);

  final _StaffEntity _self;
  final $Res Function(_StaffEntity) _then;

/// Create a copy of StaffEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? pharmacyId = null,Object? role = null,Object? phoneNumber = freezed,Object? photoUrl = freezed,Object? createdAt = null,Object? lastLoginAt = freezed,Object? isActive = null,}) {
  return _then(_StaffEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RoleEntity,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of StaffEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoleEntityCopyWith<$Res> get role {
  
  return $RoleEntityCopyWith<$Res>(_self.role, (value) {
    return _then(_self.copyWith(role: value));
  });
}
}

// dart format on
