// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StaffState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StaffState()';
}


}

/// @nodoc
class $StaffStateCopyWith<$Res>  {
$StaffStateCopyWith(StaffState _, $Res Function(StaffState) __);
}


/// Adds pattern-matching-related methods to [StaffState].
extension StaffStatePatterns on StaffState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StaffStateInitial value)?  initial,TResult Function( StaffStateLoading value)?  loading,TResult Function( StaffStateLoaded value)?  loaded,TResult Function( StaffStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StaffStateInitial() when initial != null:
return initial(_that);case StaffStateLoading() when loading != null:
return loading(_that);case StaffStateLoaded() when loaded != null:
return loaded(_that);case StaffStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StaffStateInitial value)  initial,required TResult Function( StaffStateLoading value)  loading,required TResult Function( StaffStateLoaded value)  loaded,required TResult Function( StaffStateError value)  error,}){
final _that = this;
switch (_that) {
case StaffStateInitial():
return initial(_that);case StaffStateLoading():
return loading(_that);case StaffStateLoaded():
return loaded(_that);case StaffStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StaffStateInitial value)?  initial,TResult? Function( StaffStateLoading value)?  loading,TResult? Function( StaffStateLoaded value)?  loaded,TResult? Function( StaffStateError value)?  error,}){
final _that = this;
switch (_that) {
case StaffStateInitial() when initial != null:
return initial(_that);case StaffStateLoading() when loading != null:
return loading(_that);case StaffStateLoaded() when loaded != null:
return loaded(_that);case StaffStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<StaffEntity> staffList)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StaffStateInitial() when initial != null:
return initial();case StaffStateLoading() when loading != null:
return loading();case StaffStateLoaded() when loaded != null:
return loaded(_that.staffList);case StaffStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<StaffEntity> staffList)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case StaffStateInitial():
return initial();case StaffStateLoading():
return loading();case StaffStateLoaded():
return loaded(_that.staffList);case StaffStateError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<StaffEntity> staffList)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case StaffStateInitial() when initial != null:
return initial();case StaffStateLoading() when loading != null:
return loading();case StaffStateLoaded() when loaded != null:
return loaded(_that.staffList);case StaffStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class StaffStateInitial implements StaffState {
  const StaffStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StaffState.initial()';
}


}




/// @nodoc


class StaffStateLoading implements StaffState {
  const StaffStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StaffState.loading()';
}


}




/// @nodoc


class StaffStateLoaded implements StaffState {
  const StaffStateLoaded(final  List<StaffEntity> staffList): _staffList = staffList;
  

 final  List<StaffEntity> _staffList;
 List<StaffEntity> get staffList {
  if (_staffList is EqualUnmodifiableListView) return _staffList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staffList);
}


/// Create a copy of StaffState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffStateLoadedCopyWith<StaffStateLoaded> get copyWith => _$StaffStateLoadedCopyWithImpl<StaffStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffStateLoaded&&const DeepCollectionEquality().equals(other._staffList, _staffList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_staffList));

@override
String toString() {
  return 'StaffState.loaded(staffList: $staffList)';
}


}

/// @nodoc
abstract mixin class $StaffStateLoadedCopyWith<$Res> implements $StaffStateCopyWith<$Res> {
  factory $StaffStateLoadedCopyWith(StaffStateLoaded value, $Res Function(StaffStateLoaded) _then) = _$StaffStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<StaffEntity> staffList
});




}
/// @nodoc
class _$StaffStateLoadedCopyWithImpl<$Res>
    implements $StaffStateLoadedCopyWith<$Res> {
  _$StaffStateLoadedCopyWithImpl(this._self, this._then);

  final StaffStateLoaded _self;
  final $Res Function(StaffStateLoaded) _then;

/// Create a copy of StaffState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? staffList = null,}) {
  return _then(StaffStateLoaded(
null == staffList ? _self._staffList : staffList // ignore: cast_nullable_to_non_nullable
as List<StaffEntity>,
  ));
}


}

/// @nodoc


class StaffStateError implements StaffState {
  const StaffStateError(this.message);
  

 final  String message;

/// Create a copy of StaffState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffStateErrorCopyWith<StaffStateError> get copyWith => _$StaffStateErrorCopyWithImpl<StaffStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StaffState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $StaffStateErrorCopyWith<$Res> implements $StaffStateCopyWith<$Res> {
  factory $StaffStateErrorCopyWith(StaffStateError value, $Res Function(StaffStateError) _then) = _$StaffStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StaffStateErrorCopyWithImpl<$Res>
    implements $StaffStateErrorCopyWith<$Res> {
  _$StaffStateErrorCopyWithImpl(this._self, this._then);

  final StaffStateError _self;
  final $Res Function(StaffStateError) _then;

/// Create a copy of StaffState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StaffStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
