// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryItemModel {

 String get id; String get medicineId; String get medicineName; String get dosage; String? get brandName; String? get genericName; int get currentStock; int get minStockLevel; int? get reservedQuantity; double get unitPrice; String get batchNumber; DateTime get expiryDate; DateTime get lastRestocked; String? get rackLocation; bool? get isChronicMedication; bool? get isScheduledDrug; String? get supplierName;
/// Create a copy of InventoryItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryItemModelCopyWith<InventoryItemModel> get copyWith => _$InventoryItemModelCopyWithImpl<InventoryItemModel>(this as InventoryItemModel, _$identity);

  /// Serializes this InventoryItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.medicineName, medicineName) || other.medicineName == medicineName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.currentStock, currentStock) || other.currentStock == currentStock)&&(identical(other.minStockLevel, minStockLevel) || other.minStockLevel == minStockLevel)&&(identical(other.reservedQuantity, reservedQuantity) || other.reservedQuantity == reservedQuantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.lastRestocked, lastRestocked) || other.lastRestocked == lastRestocked)&&(identical(other.rackLocation, rackLocation) || other.rackLocation == rackLocation)&&(identical(other.isChronicMedication, isChronicMedication) || other.isChronicMedication == isChronicMedication)&&(identical(other.isScheduledDrug, isScheduledDrug) || other.isScheduledDrug == isScheduledDrug)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,medicineId,medicineName,dosage,brandName,genericName,currentStock,minStockLevel,reservedQuantity,unitPrice,batchNumber,expiryDate,lastRestocked,rackLocation,isChronicMedication,isScheduledDrug,supplierName);

@override
String toString() {
  return 'InventoryItemModel(id: $id, medicineId: $medicineId, medicineName: $medicineName, dosage: $dosage, brandName: $brandName, genericName: $genericName, currentStock: $currentStock, minStockLevel: $minStockLevel, reservedQuantity: $reservedQuantity, unitPrice: $unitPrice, batchNumber: $batchNumber, expiryDate: $expiryDate, lastRestocked: $lastRestocked, rackLocation: $rackLocation, isChronicMedication: $isChronicMedication, isScheduledDrug: $isScheduledDrug, supplierName: $supplierName)';
}


}

/// @nodoc
abstract mixin class $InventoryItemModelCopyWith<$Res>  {
  factory $InventoryItemModelCopyWith(InventoryItemModel value, $Res Function(InventoryItemModel) _then) = _$InventoryItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String medicineId, String medicineName, String dosage, String? brandName, String? genericName, int currentStock, int minStockLevel, int? reservedQuantity, double unitPrice, String batchNumber, DateTime expiryDate, DateTime lastRestocked, String? rackLocation, bool? isChronicMedication, bool? isScheduledDrug, String? supplierName
});




}
/// @nodoc
class _$InventoryItemModelCopyWithImpl<$Res>
    implements $InventoryItemModelCopyWith<$Res> {
  _$InventoryItemModelCopyWithImpl(this._self, this._then);

  final InventoryItemModel _self;
  final $Res Function(InventoryItemModel) _then;

/// Create a copy of InventoryItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? medicineId = null,Object? medicineName = null,Object? dosage = null,Object? brandName = freezed,Object? genericName = freezed,Object? currentStock = null,Object? minStockLevel = null,Object? reservedQuantity = freezed,Object? unitPrice = null,Object? batchNumber = null,Object? expiryDate = null,Object? lastRestocked = null,Object? rackLocation = freezed,Object? isChronicMedication = freezed,Object? isScheduledDrug = freezed,Object? supplierName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,medicineId: null == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as String,medicineName: null == medicineName ? _self.medicineName : medicineName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,genericName: freezed == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String?,currentStock: null == currentStock ? _self.currentStock : currentStock // ignore: cast_nullable_to_non_nullable
as int,minStockLevel: null == minStockLevel ? _self.minStockLevel : minStockLevel // ignore: cast_nullable_to_non_nullable
as int,reservedQuantity: freezed == reservedQuantity ? _self.reservedQuantity : reservedQuantity // ignore: cast_nullable_to_non_nullable
as int?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastRestocked: null == lastRestocked ? _self.lastRestocked : lastRestocked // ignore: cast_nullable_to_non_nullable
as DateTime,rackLocation: freezed == rackLocation ? _self.rackLocation : rackLocation // ignore: cast_nullable_to_non_nullable
as String?,isChronicMedication: freezed == isChronicMedication ? _self.isChronicMedication : isChronicMedication // ignore: cast_nullable_to_non_nullable
as bool?,isScheduledDrug: freezed == isScheduledDrug ? _self.isScheduledDrug : isScheduledDrug // ignore: cast_nullable_to_non_nullable
as bool?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryItemModel].
extension InventoryItemModelPatterns on InventoryItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryItemModel value)  $default,){
final _that = this;
switch (_that) {
case _InventoryItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String medicineId,  String medicineName,  String dosage,  String? brandName,  String? genericName,  int currentStock,  int minStockLevel,  int? reservedQuantity,  double unitPrice,  String batchNumber,  DateTime expiryDate,  DateTime lastRestocked,  String? rackLocation,  bool? isChronicMedication,  bool? isScheduledDrug,  String? supplierName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryItemModel() when $default != null:
return $default(_that.id,_that.medicineId,_that.medicineName,_that.dosage,_that.brandName,_that.genericName,_that.currentStock,_that.minStockLevel,_that.reservedQuantity,_that.unitPrice,_that.batchNumber,_that.expiryDate,_that.lastRestocked,_that.rackLocation,_that.isChronicMedication,_that.isScheduledDrug,_that.supplierName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String medicineId,  String medicineName,  String dosage,  String? brandName,  String? genericName,  int currentStock,  int minStockLevel,  int? reservedQuantity,  double unitPrice,  String batchNumber,  DateTime expiryDate,  DateTime lastRestocked,  String? rackLocation,  bool? isChronicMedication,  bool? isScheduledDrug,  String? supplierName)  $default,) {final _that = this;
switch (_that) {
case _InventoryItemModel():
return $default(_that.id,_that.medicineId,_that.medicineName,_that.dosage,_that.brandName,_that.genericName,_that.currentStock,_that.minStockLevel,_that.reservedQuantity,_that.unitPrice,_that.batchNumber,_that.expiryDate,_that.lastRestocked,_that.rackLocation,_that.isChronicMedication,_that.isScheduledDrug,_that.supplierName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String medicineId,  String medicineName,  String dosage,  String? brandName,  String? genericName,  int currentStock,  int minStockLevel,  int? reservedQuantity,  double unitPrice,  String batchNumber,  DateTime expiryDate,  DateTime lastRestocked,  String? rackLocation,  bool? isChronicMedication,  bool? isScheduledDrug,  String? supplierName)?  $default,) {final _that = this;
switch (_that) {
case _InventoryItemModel() when $default != null:
return $default(_that.id,_that.medicineId,_that.medicineName,_that.dosage,_that.brandName,_that.genericName,_that.currentStock,_that.minStockLevel,_that.reservedQuantity,_that.unitPrice,_that.batchNumber,_that.expiryDate,_that.lastRestocked,_that.rackLocation,_that.isChronicMedication,_that.isScheduledDrug,_that.supplierName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventoryItemModel extends InventoryItemModel {
  const _InventoryItemModel({required this.id, required this.medicineId, required this.medicineName, required this.dosage, this.brandName, this.genericName, required this.currentStock, required this.minStockLevel, this.reservedQuantity, required this.unitPrice, required this.batchNumber, required this.expiryDate, required this.lastRestocked, this.rackLocation, this.isChronicMedication, this.isScheduledDrug, this.supplierName}): super._();
  factory _InventoryItemModel.fromJson(Map<String, dynamic> json) => _$InventoryItemModelFromJson(json);

@override final  String id;
@override final  String medicineId;
@override final  String medicineName;
@override final  String dosage;
@override final  String? brandName;
@override final  String? genericName;
@override final  int currentStock;
@override final  int minStockLevel;
@override final  int? reservedQuantity;
@override final  double unitPrice;
@override final  String batchNumber;
@override final  DateTime expiryDate;
@override final  DateTime lastRestocked;
@override final  String? rackLocation;
@override final  bool? isChronicMedication;
@override final  bool? isScheduledDrug;
@override final  String? supplierName;

/// Create a copy of InventoryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryItemModelCopyWith<_InventoryItemModel> get copyWith => __$InventoryItemModelCopyWithImpl<_InventoryItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventoryItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.medicineName, medicineName) || other.medicineName == medicineName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.currentStock, currentStock) || other.currentStock == currentStock)&&(identical(other.minStockLevel, minStockLevel) || other.minStockLevel == minStockLevel)&&(identical(other.reservedQuantity, reservedQuantity) || other.reservedQuantity == reservedQuantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.lastRestocked, lastRestocked) || other.lastRestocked == lastRestocked)&&(identical(other.rackLocation, rackLocation) || other.rackLocation == rackLocation)&&(identical(other.isChronicMedication, isChronicMedication) || other.isChronicMedication == isChronicMedication)&&(identical(other.isScheduledDrug, isScheduledDrug) || other.isScheduledDrug == isScheduledDrug)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,medicineId,medicineName,dosage,brandName,genericName,currentStock,minStockLevel,reservedQuantity,unitPrice,batchNumber,expiryDate,lastRestocked,rackLocation,isChronicMedication,isScheduledDrug,supplierName);

@override
String toString() {
  return 'InventoryItemModel(id: $id, medicineId: $medicineId, medicineName: $medicineName, dosage: $dosage, brandName: $brandName, genericName: $genericName, currentStock: $currentStock, minStockLevel: $minStockLevel, reservedQuantity: $reservedQuantity, unitPrice: $unitPrice, batchNumber: $batchNumber, expiryDate: $expiryDate, lastRestocked: $lastRestocked, rackLocation: $rackLocation, isChronicMedication: $isChronicMedication, isScheduledDrug: $isScheduledDrug, supplierName: $supplierName)';
}


}

/// @nodoc
abstract mixin class _$InventoryItemModelCopyWith<$Res> implements $InventoryItemModelCopyWith<$Res> {
  factory _$InventoryItemModelCopyWith(_InventoryItemModel value, $Res Function(_InventoryItemModel) _then) = __$InventoryItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String medicineId, String medicineName, String dosage, String? brandName, String? genericName, int currentStock, int minStockLevel, int? reservedQuantity, double unitPrice, String batchNumber, DateTime expiryDate, DateTime lastRestocked, String? rackLocation, bool? isChronicMedication, bool? isScheduledDrug, String? supplierName
});




}
/// @nodoc
class __$InventoryItemModelCopyWithImpl<$Res>
    implements _$InventoryItemModelCopyWith<$Res> {
  __$InventoryItemModelCopyWithImpl(this._self, this._then);

  final _InventoryItemModel _self;
  final $Res Function(_InventoryItemModel) _then;

/// Create a copy of InventoryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? medicineId = null,Object? medicineName = null,Object? dosage = null,Object? brandName = freezed,Object? genericName = freezed,Object? currentStock = null,Object? minStockLevel = null,Object? reservedQuantity = freezed,Object? unitPrice = null,Object? batchNumber = null,Object? expiryDate = null,Object? lastRestocked = null,Object? rackLocation = freezed,Object? isChronicMedication = freezed,Object? isScheduledDrug = freezed,Object? supplierName = freezed,}) {
  return _then(_InventoryItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,medicineId: null == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as String,medicineName: null == medicineName ? _self.medicineName : medicineName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,genericName: freezed == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String?,currentStock: null == currentStock ? _self.currentStock : currentStock // ignore: cast_nullable_to_non_nullable
as int,minStockLevel: null == minStockLevel ? _self.minStockLevel : minStockLevel // ignore: cast_nullable_to_non_nullable
as int,reservedQuantity: freezed == reservedQuantity ? _self.reservedQuantity : reservedQuantity // ignore: cast_nullable_to_non_nullable
as int?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastRestocked: null == lastRestocked ? _self.lastRestocked : lastRestocked // ignore: cast_nullable_to_non_nullable
as DateTime,rackLocation: freezed == rackLocation ? _self.rackLocation : rackLocation // ignore: cast_nullable_to_non_nullable
as String?,isChronicMedication: freezed == isChronicMedication ? _self.isChronicMedication : isChronicMedication // ignore: cast_nullable_to_non_nullable
as bool?,isScheduledDrug: freezed == isScheduledDrug ? _self.isScheduledDrug : isScheduledDrug // ignore: cast_nullable_to_non_nullable
as bool?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
