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
  $Res call({String id, String name, String tag, String? description});
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
  $Res call({String id, String name, String tag, String? description});
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
  final String? description;

  @override
  String toString() {
    return 'MerchOutline(id: $id, name: $name, tag: $tag, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, tag, description);

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
      final String? description}) = _$MerchImpl;

  factory _Merch.fromJson(Map<String, dynamic> json) = _$MerchImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get tag;
  @override // タグ（「野菜」など）
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
  double? get minPrice => throw _privateConstructorUsedError; // 最低価格
  double? get maxPrice => throw _privateConstructorUsedError;

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
  $Res call({String id, String name, double? minPrice, double? maxPrice});
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
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
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
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
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
  $Res call({String id, String name, double? minPrice, double? maxPrice});
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
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
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
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchDetailImpl implements _MerchDetail {
  const _$MerchDetailImpl(
      {required this.id, required this.name, this.minPrice, this.maxPrice});

  factory _$MerchDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchDetailImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double? minPrice;
// 最低価格
  @override
  final double? maxPrice;

  @override
  String toString() {
    return 'MerchDetail(id: $id, name: $name, minPrice: $minPrice, maxPrice: $maxPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, minPrice, maxPrice);

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

abstract class _MerchDetail implements MerchDetail {
  const factory _MerchDetail(
      {required final String id,
      required final String name,
      final double? minPrice,
      final double? maxPrice}) = _$MerchDetailImpl;

  factory _MerchDetail.fromJson(Map<String, dynamic> json) =
      _$MerchDetailImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double? get minPrice;
  @override // 最低価格
  double? get maxPrice;
  @override
  @JsonKey(ignore: true)
  _$$MerchDetailImplCopyWith<_$MerchDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
