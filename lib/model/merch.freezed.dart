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

Merch _$MerchFromJson(Map<String, dynamic> json) {
  return _Merch.fromJson(json);
}

/// @nodoc
mixin _$Merch {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get minPrice => throw _privateConstructorUsedError; // 最低価格
  double? get maxPrice => throw _privateConstructorUsedError; // 最高価格
  double? get averagePrice => throw _privateConstructorUsedError; // 平均価格
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchCopyWith<Merch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchCopyWith<$Res> {
  factory $MerchCopyWith(Merch value, $Res Function(Merch) then) =
      _$MerchCopyWithImpl<$Res, Merch>;
  @useResult
  $Res call(
      {String id,
      String name,
      double? minPrice,
      double? maxPrice,
      double? averagePrice,
      String? description});
}

/// @nodoc
class _$MerchCopyWithImpl<$Res, $Val extends Merch>
    implements $MerchCopyWith<$Res> {
  _$MerchCopyWithImpl(this._value, this._then);

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
    Object? averagePrice = freezed,
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
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      averagePrice: freezed == averagePrice
          ? _value.averagePrice
          : averagePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MerchImplCopyWith<$Res> implements $MerchCopyWith<$Res> {
  factory _$$MerchImplCopyWith(
          _$MerchImpl value, $Res Function(_$MerchImpl) then) =
      __$$MerchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double? minPrice,
      double? maxPrice,
      double? averagePrice,
      String? description});
}

/// @nodoc
class __$$MerchImplCopyWithImpl<$Res>
    extends _$MerchCopyWithImpl<$Res, _$MerchImpl>
    implements _$$MerchImplCopyWith<$Res> {
  __$$MerchImplCopyWithImpl(
      _$MerchImpl _value, $Res Function(_$MerchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? averagePrice = freezed,
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
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      averagePrice: freezed == averagePrice
          ? _value.averagePrice
          : averagePrice // ignore: cast_nullable_to_non_nullable
              as double?,
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
      this.minPrice,
      this.maxPrice,
      this.averagePrice,
      this.description});

  factory _$MerchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double? minPrice;
// 最低価格
  @override
  final double? maxPrice;
// 最高価格
  @override
  final double? averagePrice;
// 平均価格
  @override
  final String? description;

  @override
  String toString() {
    return 'Merch(id: $id, name: $name, minPrice: $minPrice, maxPrice: $maxPrice, averagePrice: $averagePrice, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, minPrice, maxPrice, averagePrice, description);

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

abstract class _Merch implements Merch {
  const factory _Merch(
      {required final String id,
      required final String name,
      final double? minPrice,
      final double? maxPrice,
      final double? averagePrice,
      final String? description}) = _$MerchImpl;

  factory _Merch.fromJson(Map<String, dynamic> json) = _$MerchImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double? get minPrice;
  @override // 最低価格
  double? get maxPrice;
  @override // 最高価格
  double? get averagePrice;
  @override // 平均価格
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$MerchImplCopyWith<_$MerchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
