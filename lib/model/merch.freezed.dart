// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MerchOutline _$MerchOutlineFromJson(Map<String, dynamic> json) {
  return _Merch.fromJson(json);
}

/// @nodoc
mixin _$MerchOutline {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError; // タグ（「野菜」など）
  String get unit => throw _privateConstructorUsedError; // 単位（「g」など）
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get amount => throw _privateConstructorUsedError; // 量（「100g」など）
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchOutlineCopyWith<MerchOutline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchOutlineCopyWith<$Res> {
  factory $MerchOutlineCopyWith(
          MerchOutline value, $Res Function(MerchOutline) then) =
      _$MerchOutlineCopyWithImpl<$Res, MerchOutline>;
  @useResult
  $Res call(
      {String id,
      String name,
      String tag,
      String unit,
      @JsonKey(includeFromJson: false, includeToJson: false) int? amount,
      String? description});
}

/// @nodoc
class _$MerchOutlineCopyWithImpl<$Res, $Val extends MerchOutline>
    implements $MerchOutlineCopyWith<$Res> {
  _$MerchOutlineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tag = null,
    Object? unit = null,
    Object? amount = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MerchImplCopyWith<$Res>
    implements $MerchOutlineCopyWith<$Res> {
  factory _$$MerchImplCopyWith(
          _$MerchImpl value, $Res Function(_$MerchImpl) then) =
      __$$MerchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String tag,
      String unit,
      @JsonKey(includeFromJson: false, includeToJson: false) int? amount,
      String? description});
}

/// @nodoc
class __$$MerchImplCopyWithImpl<$Res>
    extends _$MerchOutlineCopyWithImpl<$Res, _$MerchImpl>
    implements _$$MerchImplCopyWith<$Res> {
  __$$MerchImplCopyWithImpl(
      _$MerchImpl _value, $Res Function(_$MerchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tag = null,
    Object? unit = null,
    Object? amount = freezed,
    Object? description = freezed,
  }) {
    return _then(_$MerchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchImpl implements _Merch {
  const _$MerchImpl(
      {required this.id,
      required this.name,
      required this.tag,
      required this.unit,
      @JsonKey(includeFromJson: false, includeToJson: false) this.amount,
      this.description});

  factory _$MerchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String tag;
// タグ（「野菜」など）
  @override
  final String unit;
// 単位（「g」など）
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? amount;
// 量（「100g」など）
  @override
  final String? description;

  @override
  String toString() {
    return 'MerchOutline(id: $id, name: $name, tag: $tag, unit: $unit, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, tag, unit, amount, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchImplCopyWith<_$MerchImpl> get copyWith =>
      __$$MerchImplCopyWithImpl<_$MerchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchImplToJson(
      this,
    );
  }
}

abstract class _Merch implements MerchOutline {
  const factory _Merch(
      {required final String id,
      required final String name,
      required final String tag,
      required final String unit,
      @JsonKey(includeFromJson: false, includeToJson: false) final int? amount,
      final String? description}) = _$MerchImpl;

  factory _Merch.fromJson(Map<String, dynamic> json) = _$MerchImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get tag;
  @override // タグ（「野菜」など）
  String get unit;
  @override // 単位（「g」など）
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get amount;
  @override // 量（「100g」など）
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$MerchImplCopyWith<_$MerchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MerchDetail _$MerchDetailFromJson(Map<String, dynamic> json) {
  return _MerchDetail.fromJson(json);
}

/// @nodoc
mixin _$MerchDetail {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get sumPrice => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchDetailCopyWith<MerchDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchDetailCopyWith<$Res> {
  factory $MerchDetailCopyWith(
          MerchDetail value, $Res Function(MerchDetail) then) =
      _$MerchDetailCopyWithImpl<$Res, MerchDetail>;
  @useResult
  $Res call(
      {String id,
      String name,
      double sumPrice,
      int count,
      @JsonKey(includeFromJson: false, includeToJson: false) int? amount,
      @JsonKey(includeFromJson: false, includeToJson: false) String? unit});
}

/// @nodoc
class _$MerchDetailCopyWithImpl<$Res, $Val extends MerchDetail>
    implements $MerchDetailCopyWith<$Res> {
  _$MerchDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sumPrice = null,
    Object? count = null,
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sumPrice: null == sumPrice
          ? _value.sumPrice
          : sumPrice // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MerchDetailImplCopyWith<$Res>
    implements $MerchDetailCopyWith<$Res> {
  factory _$$MerchDetailImplCopyWith(
          _$MerchDetailImpl value, $Res Function(_$MerchDetailImpl) then) =
      __$$MerchDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double sumPrice,
      int count,
      @JsonKey(includeFromJson: false, includeToJson: false) int? amount,
      @JsonKey(includeFromJson: false, includeToJson: false) String? unit});
}

/// @nodoc
class __$$MerchDetailImplCopyWithImpl<$Res>
    extends _$MerchDetailCopyWithImpl<$Res, _$MerchDetailImpl>
    implements _$$MerchDetailImplCopyWith<$Res> {
  __$$MerchDetailImplCopyWithImpl(
      _$MerchDetailImpl _value, $Res Function(_$MerchDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sumPrice = null,
    Object? count = null,
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$MerchDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sumPrice: null == sumPrice
          ? _value.sumPrice
          : sumPrice // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchDetailImpl extends _MerchDetail {
  const _$MerchDetailImpl(
      {required this.id,
      required this.name,
      required this.sumPrice,
      required this.count,
      @JsonKey(includeFromJson: false, includeToJson: false) this.amount,
      @JsonKey(includeFromJson: false, includeToJson: false) this.unit})
      : super._();

  factory _$MerchDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchDetailImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double sumPrice;
  @override
  final int count;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? amount;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? unit;

  @override
  String toString() {
    return 'MerchDetail(id: $id, name: $name, sumPrice: $sumPrice, count: $count, amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sumPrice, sumPrice) ||
                other.sumPrice == sumPrice) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, sumPrice, count, amount, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchDetailImplCopyWith<_$MerchDetailImpl> get copyWith =>
      __$$MerchDetailImplCopyWithImpl<_$MerchDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchDetailImplToJson(
      this,
    );
  }
}

abstract class _MerchDetail extends MerchDetail {
  const factory _MerchDetail(
      {required final String id,
      required final String name,
      required final double sumPrice,
      required final int count,
      @JsonKey(includeFromJson: false, includeToJson: false) final int? amount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? unit}) = _$MerchDetailImpl;
  const _MerchDetail._() : super._();

  factory _MerchDetail.fromJson(Map<String, dynamic> json) =
      _$MerchDetailImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get sumPrice;
  @override
  int get count;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get amount;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$MerchDetailImplCopyWith<_$MerchDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostedMerch _$PostedMerchFromJson(Map<String, dynamic> json) {
  return _PostedMerch.fromJson(json);
}

/// @nodoc
mixin _$PostedMerch {
  String get id => throw _privateConstructorUsedError;
  String get merchDetailId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostedMerchCopyWith<PostedMerch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostedMerchCopyWith<$Res> {
  factory $PostedMerchCopyWith(
          PostedMerch value, $Res Function(PostedMerch) then) =
      _$PostedMerchCopyWithImpl<$Res, PostedMerch>;
  @useResult
  $Res call(
      {String id,
      String merchDetailId,
      double price,
      int amount,
      String date,
      String? description,
      String? imageUrl});
}

/// @nodoc
class _$PostedMerchCopyWithImpl<$Res, $Val extends PostedMerch>
    implements $PostedMerchCopyWith<$Res> {
  _$PostedMerchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? merchDetailId = null,
    Object? price = null,
    Object? amount = null,
    Object? date = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      merchDetailId: null == merchDetailId
          ? _value.merchDetailId
          : merchDetailId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostedMerchImplCopyWith<$Res>
    implements $PostedMerchCopyWith<$Res> {
  factory _$$PostedMerchImplCopyWith(
          _$PostedMerchImpl value, $Res Function(_$PostedMerchImpl) then) =
      __$$PostedMerchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String merchDetailId,
      double price,
      int amount,
      String date,
      String? description,
      String? imageUrl});
}

/// @nodoc
class __$$PostedMerchImplCopyWithImpl<$Res>
    extends _$PostedMerchCopyWithImpl<$Res, _$PostedMerchImpl>
    implements _$$PostedMerchImplCopyWith<$Res> {
  __$$PostedMerchImplCopyWithImpl(
      _$PostedMerchImpl _value, $Res Function(_$PostedMerchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? merchDetailId = null,
    Object? price = null,
    Object? amount = null,
    Object? date = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$PostedMerchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      merchDetailId: null == merchDetailId
          ? _value.merchDetailId
          : merchDetailId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostedMerchImpl implements _PostedMerch {
  const _$PostedMerchImpl(
      {required this.id,
      required this.merchDetailId,
      required this.price,
      required this.amount,
      required this.date,
      this.description,
      this.imageUrl});

  factory _$PostedMerchImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostedMerchImplFromJson(json);

  @override
  final String id;
  @override
  final String merchDetailId;
  @override
  final double price;
  @override
  final int amount;
  @override
  final String date;
  @override
  final String? description;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'PostedMerch(id: $id, merchDetailId: $merchDetailId, price: $price, amount: $amount, date: $date, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostedMerchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.merchDetailId, merchDetailId) ||
                other.merchDetailId == merchDetailId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, merchDetailId, price, amount,
      date, description, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostedMerchImplCopyWith<_$PostedMerchImpl> get copyWith =>
      __$$PostedMerchImplCopyWithImpl<_$PostedMerchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostedMerchImplToJson(
      this,
    );
  }
}

abstract class _PostedMerch implements PostedMerch {
  const factory _PostedMerch(
      {required final String id,
      required final String merchDetailId,
      required final double price,
      required final int amount,
      required final String date,
      final String? description,
      final String? imageUrl}) = _$PostedMerchImpl;

  factory _PostedMerch.fromJson(Map<String, dynamic> json) =
      _$PostedMerchImpl.fromJson;

  @override
  String get id;
  @override
  String get merchDetailId;
  @override
  double get price;
  @override
  int get amount;
  @override
  String get date;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$PostedMerchImplCopyWith<_$PostedMerchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
