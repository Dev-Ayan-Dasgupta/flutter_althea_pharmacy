// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get pharmacyId => throw _privateConstructorUsedError;
  RoleEntity get role => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StaffEntityCopyWith<StaffEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffEntityCopyWith<$Res> {
  factory $StaffEntityCopyWith(
          StaffEntity value, $Res Function(StaffEntity) then) =
      _$StaffEntityCopyWithImpl<$Res, StaffEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String pharmacyId,
      RoleEntity role,
      String? phoneNumber,
      String? photoUrl,
      DateTime createdAt,
      DateTime? lastLoginAt,
      bool isActive});
}

/// @nodoc
class _$StaffEntityCopyWithImpl<$Res, $Val extends StaffEntity>
    implements $StaffEntityCopyWith<$Res> {
  _$StaffEntityCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? pharmacyId = null,
    Object? role = null,
    Object? phoneNumber = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? lastLoginAt = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id,
      name: null == name
          ? _value.name
          : name,
      email: null == email
          ? _value.email
          : email,
      pharmacyId: null == pharmacyId
          ? _value.pharmacyId
          : pharmacyId,
      role: null == role
          ? _value.role
          : role,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt,
      isActive: null == isActive
          ? _value.isActive
          : isActive,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffEntityImplCopyWith<$Res>
    implements $StaffEntityCopyWith<$Res> {
  factory _$$StaffEntityImplCopyWith(
          _$StaffEntityImpl value, $Res Function(_$StaffEntityImpl) then) =
      __$$StaffEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String pharmacyId,
      RoleEntity role,
      String? phoneNumber,
      String? photoUrl,
      DateTime createdAt,
      DateTime? lastLoginAt,
      bool isActive});
}

/// @nodoc
class __$$StaffEntityImplCopyWithImpl<$Res>
    extends _$StaffEntityCopyWithImpl<$Res, _$StaffEntityImpl>
    implements _$$StaffEntityImplCopyWith<$Res> {
  __$$StaffEntityImplCopyWithImpl(
      _$StaffEntityImpl _value, $Res Function(_$StaffEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? pharmacyId = null,
    Object? role = null,
    Object? phoneNumber = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? lastLoginAt = freezed,
    Object? isActive = null,
  }) {
    return _then(_$StaffEntityImpl(
      id: null == id ? _value.id : id as String,
      name: null == name ? _value.name : name as String,
      email: null == email ? _value.email : email as String,
      pharmacyId: null == pharmacyId ? _value.pharmacyId : pharmacyId as String,
      role: null == role ? _value.role : role as RoleEntity,
      phoneNumber: freezed == phoneNumber ? _value.phoneNumber : phoneNumber as String?,
      photoUrl: freezed == photoUrl ? _value.photoUrl : photoUrl as String?,
      createdAt: null == createdAt ? _value.createdAt : createdAt as DateTime,
      lastLoginAt: freezed == lastLoginAt ? _value.lastLoginAt : lastLoginAt as DateTime?,
      isActive: null == isActive ? _value.isActive : isActive as bool,
    ));
  }
}

/// @nodoc
class _$StaffEntityImpl implements _StaffEntity {
  const _$StaffEntityImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.pharmacyId,
      required this.role,
      this.phoneNumber,
      this.photoUrl,
      required this.createdAt,
      this.lastLoginAt,
      this.isActive = true});

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String pharmacyId;
  @override
  final RoleEntity role;
  @override
  final String? phoneNumber;
  @override
  final String? photoUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastLoginAt;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'StaffEntity(id: $id, name: $name, email: $email, pharmacyId: $pharmacyId, role: $role, phoneNumber: $phoneNumber, photoUrl: $photoUrl, createdAt: $createdAt, lastLoginAt: $lastLoginAt, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pharmacyId, pharmacyId) ||
                other.pharmacyId == pharmacyId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, pharmacyId,
      role, phoneNumber, photoUrl, createdAt, lastLoginAt, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffEntityImplCopyWith<_$StaffEntityImpl> get copyWith =>
      __$$StaffEntityImplCopyWithImpl<_$StaffEntityImpl>(this, _$identity);
}

abstract class _StaffEntity implements StaffEntity {
  const factory _StaffEntity(
      {required final String id,
      required final String name,
      required final String email,
      required final String pharmacyId,
      required final RoleEntity role,
      final String? phoneNumber,
      final String? photoUrl,
      required final DateTime createdAt,
      final DateTime? lastLoginAt,
      final bool isActive}) = _$StaffEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get pharmacyId;
  @override
  RoleEntity get role;
  @override
  String? get phoneNumber;
  @override
  String? get photoUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastLoginAt;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$StaffEntityImplCopyWith<_$StaffEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
const _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');
