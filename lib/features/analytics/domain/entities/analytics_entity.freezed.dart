// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsEntity {

 double get totalEarnings; double get pharmacyShare; double get deliveryFee; double get platformFee; int get totalOrders; int get completedOrders; int get cancelledOrders; double get averageOrderValue; List<DailyEarning> get dailyEarnings; List<CategoryEarning> get categoryEarnings; DateTime get startDate; DateTime get endDate;
/// Create a copy of AnalyticsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsEntityCopyWith<AnalyticsEntity> get copyWith => _$AnalyticsEntityCopyWithImpl<AnalyticsEntity>(this as AnalyticsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsEntity&&(identical(other.totalEarnings, totalEarnings) || other.totalEarnings == totalEarnings)&&(identical(other.pharmacyShare, pharmacyShare) || other.pharmacyShare == pharmacyShare)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.platformFee, platformFee) || other.platformFee == platformFee)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.completedOrders, completedOrders) || other.completedOrders == completedOrders)&&(identical(other.cancelledOrders, cancelledOrders) || other.cancelledOrders == cancelledOrders)&&(identical(other.averageOrderValue, averageOrderValue) || other.averageOrderValue == averageOrderValue)&&const DeepCollectionEquality().equals(other.dailyEarnings, dailyEarnings)&&const DeepCollectionEquality().equals(other.categoryEarnings, categoryEarnings)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,totalEarnings,pharmacyShare,deliveryFee,platformFee,totalOrders,completedOrders,cancelledOrders,averageOrderValue,const DeepCollectionEquality().hash(dailyEarnings),const DeepCollectionEquality().hash(categoryEarnings),startDate,endDate);

@override
String toString() {
  return 'AnalyticsEntity(totalEarnings: $totalEarnings, pharmacyShare: $pharmacyShare, deliveryFee: $deliveryFee, platformFee: $platformFee, totalOrders: $totalOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, averageOrderValue: $averageOrderValue, dailyEarnings: $dailyEarnings, categoryEarnings: $categoryEarnings, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $AnalyticsEntityCopyWith<$Res>  {
  factory $AnalyticsEntityCopyWith(AnalyticsEntity value, $Res Function(AnalyticsEntity) _then) = _$AnalyticsEntityCopyWithImpl;
@useResult
$Res call({
 double totalEarnings, double pharmacyShare, double deliveryFee, double platformFee, int totalOrders, int completedOrders, int cancelledOrders, double averageOrderValue, List<DailyEarning> dailyEarnings, List<CategoryEarning> categoryEarnings, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class _$AnalyticsEntityCopyWithImpl<$Res>
    implements $AnalyticsEntityCopyWith<$Res> {
  _$AnalyticsEntityCopyWithImpl(this._self, this._then);

  final AnalyticsEntity _self;
  final $Res Function(AnalyticsEntity) _then;

/// Create a copy of AnalyticsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalEarnings = null,Object? pharmacyShare = null,Object? deliveryFee = null,Object? platformFee = null,Object? totalOrders = null,Object? completedOrders = null,Object? cancelledOrders = null,Object? averageOrderValue = null,Object? dailyEarnings = null,Object? categoryEarnings = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
totalEarnings: null == totalEarnings ? _self.totalEarnings : totalEarnings // ignore: cast_nullable_to_non_nullable
as double,pharmacyShare: null == pharmacyShare ? _self.pharmacyShare : pharmacyShare // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,platformFee: null == platformFee ? _self.platformFee : platformFee // ignore: cast_nullable_to_non_nullable
as double,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,completedOrders: null == completedOrders ? _self.completedOrders : completedOrders // ignore: cast_nullable_to_non_nullable
as int,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as int,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as double,dailyEarnings: null == dailyEarnings ? _self.dailyEarnings : dailyEarnings // ignore: cast_nullable_to_non_nullable
as List<DailyEarning>,categoryEarnings: null == categoryEarnings ? _self.categoryEarnings : categoryEarnings // ignore: cast_nullable_to_non_nullable
as List<CategoryEarning>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsEntity].
extension AnalyticsEntityPatterns on AnalyticsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsEntity value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalEarnings,  double pharmacyShare,  double deliveryFee,  double platformFee,  int totalOrders,  int completedOrders,  int cancelledOrders,  double averageOrderValue,  List<DailyEarning> dailyEarnings,  List<CategoryEarning> categoryEarnings,  DateTime startDate,  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsEntity() when $default != null:
return $default(_that.totalEarnings,_that.pharmacyShare,_that.deliveryFee,_that.platformFee,_that.totalOrders,_that.completedOrders,_that.cancelledOrders,_that.averageOrderValue,_that.dailyEarnings,_that.categoryEarnings,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalEarnings,  double pharmacyShare,  double deliveryFee,  double platformFee,  int totalOrders,  int completedOrders,  int cancelledOrders,  double averageOrderValue,  List<DailyEarning> dailyEarnings,  List<CategoryEarning> categoryEarnings,  DateTime startDate,  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsEntity():
return $default(_that.totalEarnings,_that.pharmacyShare,_that.deliveryFee,_that.platformFee,_that.totalOrders,_that.completedOrders,_that.cancelledOrders,_that.averageOrderValue,_that.dailyEarnings,_that.categoryEarnings,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalEarnings,  double pharmacyShare,  double deliveryFee,  double platformFee,  int totalOrders,  int completedOrders,  int cancelledOrders,  double averageOrderValue,  List<DailyEarning> dailyEarnings,  List<CategoryEarning> categoryEarnings,  DateTime startDate,  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsEntity() when $default != null:
return $default(_that.totalEarnings,_that.pharmacyShare,_that.deliveryFee,_that.platformFee,_that.totalOrders,_that.completedOrders,_that.cancelledOrders,_that.averageOrderValue,_that.dailyEarnings,_that.categoryEarnings,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsEntity implements AnalyticsEntity {
  const _AnalyticsEntity({required this.totalEarnings, required this.pharmacyShare, required this.deliveryFee, required this.platformFee, required this.totalOrders, required this.completedOrders, required this.cancelledOrders, required this.averageOrderValue, required final  List<DailyEarning> dailyEarnings, required final  List<CategoryEarning> categoryEarnings, required this.startDate, required this.endDate}): _dailyEarnings = dailyEarnings,_categoryEarnings = categoryEarnings;
  

@override final  double totalEarnings;
@override final  double pharmacyShare;
@override final  double deliveryFee;
@override final  double platformFee;
@override final  int totalOrders;
@override final  int completedOrders;
@override final  int cancelledOrders;
@override final  double averageOrderValue;
 final  List<DailyEarning> _dailyEarnings;
@override List<DailyEarning> get dailyEarnings {
  if (_dailyEarnings is EqualUnmodifiableListView) return _dailyEarnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyEarnings);
}

 final  List<CategoryEarning> _categoryEarnings;
@override List<CategoryEarning> get categoryEarnings {
  if (_categoryEarnings is EqualUnmodifiableListView) return _categoryEarnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryEarnings);
}

@override final  DateTime startDate;
@override final  DateTime endDate;

/// Create a copy of AnalyticsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsEntityCopyWith<_AnalyticsEntity> get copyWith => __$AnalyticsEntityCopyWithImpl<_AnalyticsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsEntity&&(identical(other.totalEarnings, totalEarnings) || other.totalEarnings == totalEarnings)&&(identical(other.pharmacyShare, pharmacyShare) || other.pharmacyShare == pharmacyShare)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.platformFee, platformFee) || other.platformFee == platformFee)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.completedOrders, completedOrders) || other.completedOrders == completedOrders)&&(identical(other.cancelledOrders, cancelledOrders) || other.cancelledOrders == cancelledOrders)&&(identical(other.averageOrderValue, averageOrderValue) || other.averageOrderValue == averageOrderValue)&&const DeepCollectionEquality().equals(other._dailyEarnings, _dailyEarnings)&&const DeepCollectionEquality().equals(other._categoryEarnings, _categoryEarnings)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,totalEarnings,pharmacyShare,deliveryFee,platformFee,totalOrders,completedOrders,cancelledOrders,averageOrderValue,const DeepCollectionEquality().hash(_dailyEarnings),const DeepCollectionEquality().hash(_categoryEarnings),startDate,endDate);

@override
String toString() {
  return 'AnalyticsEntity(totalEarnings: $totalEarnings, pharmacyShare: $pharmacyShare, deliveryFee: $deliveryFee, platformFee: $platformFee, totalOrders: $totalOrders, completedOrders: $completedOrders, cancelledOrders: $cancelledOrders, averageOrderValue: $averageOrderValue, dailyEarnings: $dailyEarnings, categoryEarnings: $categoryEarnings, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsEntityCopyWith<$Res> implements $AnalyticsEntityCopyWith<$Res> {
  factory _$AnalyticsEntityCopyWith(_AnalyticsEntity value, $Res Function(_AnalyticsEntity) _then) = __$AnalyticsEntityCopyWithImpl;
@override @useResult
$Res call({
 double totalEarnings, double pharmacyShare, double deliveryFee, double platformFee, int totalOrders, int completedOrders, int cancelledOrders, double averageOrderValue, List<DailyEarning> dailyEarnings, List<CategoryEarning> categoryEarnings, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class __$AnalyticsEntityCopyWithImpl<$Res>
    implements _$AnalyticsEntityCopyWith<$Res> {
  __$AnalyticsEntityCopyWithImpl(this._self, this._then);

  final _AnalyticsEntity _self;
  final $Res Function(_AnalyticsEntity) _then;

/// Create a copy of AnalyticsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalEarnings = null,Object? pharmacyShare = null,Object? deliveryFee = null,Object? platformFee = null,Object? totalOrders = null,Object? completedOrders = null,Object? cancelledOrders = null,Object? averageOrderValue = null,Object? dailyEarnings = null,Object? categoryEarnings = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_AnalyticsEntity(
totalEarnings: null == totalEarnings ? _self.totalEarnings : totalEarnings // ignore: cast_nullable_to_non_nullable
as double,pharmacyShare: null == pharmacyShare ? _self.pharmacyShare : pharmacyShare // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,platformFee: null == platformFee ? _self.platformFee : platformFee // ignore: cast_nullable_to_non_nullable
as double,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,completedOrders: null == completedOrders ? _self.completedOrders : completedOrders // ignore: cast_nullable_to_non_nullable
as int,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as int,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as double,dailyEarnings: null == dailyEarnings ? _self._dailyEarnings : dailyEarnings // ignore: cast_nullable_to_non_nullable
as List<DailyEarning>,categoryEarnings: null == categoryEarnings ? _self._categoryEarnings : categoryEarnings // ignore: cast_nullable_to_non_nullable
as List<CategoryEarning>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$DailyEarning {

 DateTime get date; double get amount; int get orderCount;
/// Create a copy of DailyEarning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyEarningCopyWith<DailyEarning> get copyWith => _$DailyEarningCopyWithImpl<DailyEarning>(this as DailyEarning, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyEarning&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount));
}


@override
int get hashCode => Object.hash(runtimeType,date,amount,orderCount);

@override
String toString() {
  return 'DailyEarning(date: $date, amount: $amount, orderCount: $orderCount)';
}


}

/// @nodoc
abstract mixin class $DailyEarningCopyWith<$Res>  {
  factory $DailyEarningCopyWith(DailyEarning value, $Res Function(DailyEarning) _then) = _$DailyEarningCopyWithImpl;
@useResult
$Res call({
 DateTime date, double amount, int orderCount
});




}
/// @nodoc
class _$DailyEarningCopyWithImpl<$Res>
    implements $DailyEarningCopyWith<$Res> {
  _$DailyEarningCopyWithImpl(this._self, this._then);

  final DailyEarning _self;
  final $Res Function(DailyEarning) _then;

/// Create a copy of DailyEarning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? amount = null,Object? orderCount = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyEarning].
extension DailyEarningPatterns on DailyEarning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyEarning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyEarning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyEarning value)  $default,){
final _that = this;
switch (_that) {
case _DailyEarning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyEarning value)?  $default,){
final _that = this;
switch (_that) {
case _DailyEarning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double amount,  int orderCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyEarning() when $default != null:
return $default(_that.date,_that.amount,_that.orderCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double amount,  int orderCount)  $default,) {final _that = this;
switch (_that) {
case _DailyEarning():
return $default(_that.date,_that.amount,_that.orderCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double amount,  int orderCount)?  $default,) {final _that = this;
switch (_that) {
case _DailyEarning() when $default != null:
return $default(_that.date,_that.amount,_that.orderCount);case _:
  return null;

}
}

}

/// @nodoc


class _DailyEarning implements DailyEarning {
  const _DailyEarning({required this.date, required this.amount, required this.orderCount});
  

@override final  DateTime date;
@override final  double amount;
@override final  int orderCount;

/// Create a copy of DailyEarning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyEarningCopyWith<_DailyEarning> get copyWith => __$DailyEarningCopyWithImpl<_DailyEarning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyEarning&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount));
}


@override
int get hashCode => Object.hash(runtimeType,date,amount,orderCount);

@override
String toString() {
  return 'DailyEarning(date: $date, amount: $amount, orderCount: $orderCount)';
}


}

/// @nodoc
abstract mixin class _$DailyEarningCopyWith<$Res> implements $DailyEarningCopyWith<$Res> {
  factory _$DailyEarningCopyWith(_DailyEarning value, $Res Function(_DailyEarning) _then) = __$DailyEarningCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double amount, int orderCount
});




}
/// @nodoc
class __$DailyEarningCopyWithImpl<$Res>
    implements _$DailyEarningCopyWith<$Res> {
  __$DailyEarningCopyWithImpl(this._self, this._then);

  final _DailyEarning _self;
  final $Res Function(_DailyEarning) _then;

/// Create a copy of DailyEarning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? amount = null,Object? orderCount = null,}) {
  return _then(_DailyEarning(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CategoryEarning {

 String get category; double get amount; double get percentage;
/// Create a copy of CategoryEarning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryEarningCopyWith<CategoryEarning> get copyWith => _$CategoryEarningCopyWithImpl<CategoryEarning>(this as CategoryEarning, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEarning&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,category,amount,percentage);

@override
String toString() {
  return 'CategoryEarning(category: $category, amount: $amount, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $CategoryEarningCopyWith<$Res>  {
  factory $CategoryEarningCopyWith(CategoryEarning value, $Res Function(CategoryEarning) _then) = _$CategoryEarningCopyWithImpl;
@useResult
$Res call({
 String category, double amount, double percentage
});




}
/// @nodoc
class _$CategoryEarningCopyWithImpl<$Res>
    implements $CategoryEarningCopyWith<$Res> {
  _$CategoryEarningCopyWithImpl(this._self, this._then);

  final CategoryEarning _self;
  final $Res Function(CategoryEarning) _then;

/// Create a copy of CategoryEarning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? amount = null,Object? percentage = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryEarning].
extension CategoryEarningPatterns on CategoryEarning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryEarning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryEarning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryEarning value)  $default,){
final _that = this;
switch (_that) {
case _CategoryEarning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryEarning value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryEarning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  double amount,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryEarning() when $default != null:
return $default(_that.category,_that.amount,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  double amount,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _CategoryEarning():
return $default(_that.category,_that.amount,_that.percentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  double amount,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _CategoryEarning() when $default != null:
return $default(_that.category,_that.amount,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryEarning implements CategoryEarning {
  const _CategoryEarning({required this.category, required this.amount, required this.percentage});
  

@override final  String category;
@override final  double amount;
@override final  double percentage;

/// Create a copy of CategoryEarning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryEarningCopyWith<_CategoryEarning> get copyWith => __$CategoryEarningCopyWithImpl<_CategoryEarning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryEarning&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,category,amount,percentage);

@override
String toString() {
  return 'CategoryEarning(category: $category, amount: $amount, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$CategoryEarningCopyWith<$Res> implements $CategoryEarningCopyWith<$Res> {
  factory _$CategoryEarningCopyWith(_CategoryEarning value, $Res Function(_CategoryEarning) _then) = __$CategoryEarningCopyWithImpl;
@override @useResult
$Res call({
 String category, double amount, double percentage
});




}
/// @nodoc
class __$CategoryEarningCopyWithImpl<$Res>
    implements _$CategoryEarningCopyWith<$Res> {
  __$CategoryEarningCopyWithImpl(this._self, this._then);

  final _CategoryEarning _self;
  final $Res Function(_CategoryEarning) _then;

/// Create a copy of CategoryEarning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? amount = null,Object? percentage = null,}) {
  return _then(_CategoryEarning(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
