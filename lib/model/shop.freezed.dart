// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return _Shop.fromJson(json);
}

/// @nodoc
mixin _$Shop {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_open")
  Map<String, String> get open => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_close")
  Map<String, String> get close => throw _privateConstructorUsedError;
  Map<String, String> get comments => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_tel")
  String get tel => throw _privateConstructorUsedError;
  List<MerchDetail> get merchList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopCopyWith<Shop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCopyWith<$Res> {
  factory $ShopCopyWith(Shop value, $Res Function(Shop) then) =
      _$ShopCopyWithImpl<$Res, Shop>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "shop_name") String name,
      @JsonKey(name: "shop_open") Map<String, String> open,
      @JsonKey(name: "shop_close") Map<String, String> close,
      Map<String, String> comments,
      double latitude,
      double longitude,
      @JsonKey(name: "shop_address") String address,
      @JsonKey(name: "shop_tel") String tel,
      List<MerchDetail> merchList});
}

/// @nodoc
class _$ShopCopyWithImpl<$Res, $Val extends Shop>
    implements $ShopCopyWith<$Res> {
  _$ShopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? open = null,
    Object? close = null,
    Object? comments = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? tel = null,
    Object? merchList = null,
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
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      merchList: null == merchList
          ? _value.merchList
          : merchList // ignore: cast_nullable_to_non_nullable
              as List<MerchDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopImplCopyWith<$Res> implements $ShopCopyWith<$Res> {
  factory _$$ShopImplCopyWith(
          _$ShopImpl value, $Res Function(_$ShopImpl) then) =
      __$$ShopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "shop_name") String name,
      @JsonKey(name: "shop_open") Map<String, String> open,
      @JsonKey(name: "shop_close") Map<String, String> close,
      Map<String, String> comments,
      double latitude,
      double longitude,
      @JsonKey(name: "shop_address") String address,
      @JsonKey(name: "shop_tel") String tel,
      List<MerchDetail> merchList});
}

/// @nodoc
class __$$ShopImplCopyWithImpl<$Res>
    extends _$ShopCopyWithImpl<$Res, _$ShopImpl>
    implements _$$ShopImplCopyWith<$Res> {
  __$$ShopImplCopyWithImpl(_$ShopImpl _value, $Res Function(_$ShopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? open = null,
    Object? close = null,
    Object? comments = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? tel = null,
    Object? merchList = null,
  }) {
    return _then(_$ShopImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      open: null == open
          ? _value._open
          : open // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      close: null == close
          ? _value._close
          : close // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      merchList: null == merchList
          ? _value._merchList
          : merchList // ignore: cast_nullable_to_non_nullable
              as List<MerchDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopImpl implements _Shop {
  const _$ShopImpl(
      {required this.id,
      @JsonKey(name: "shop_name") required this.name,
      @JsonKey(name: "shop_open") required final Map<String, String> open,
      @JsonKey(name: "shop_close") required final Map<String, String> close,
      required final Map<String, String> comments,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: "shop_address") required this.address,
      @JsonKey(name: "shop_tel") required this.tel,
      required final List<MerchDetail> merchList})
      : _open = open,
        _close = close,
        _comments = comments,
        _merchList = merchList;

  factory _$ShopImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "shop_name")
  final String name;
  final Map<String, String> _open;
  @override
  @JsonKey(name: "shop_open")
  Map<String, String> get open {
    if (_open is EqualUnmodifiableMapView) return _open;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_open);
  }

  final Map<String, String> _close;
  @override
  @JsonKey(name: "shop_close")
  Map<String, String> get close {
    if (_close is EqualUnmodifiableMapView) return _close;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_close);
  }

  final Map<String, String> _comments;
  @override
  Map<String, String> get comments {
    if (_comments is EqualUnmodifiableMapView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_comments);
  }

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: "shop_address")
  final String address;
  @override
  @JsonKey(name: "shop_tel")
  final String tel;
  final List<MerchDetail> _merchList;
  @override
  List<MerchDetail> get merchList {
    if (_merchList is EqualUnmodifiableListView) return _merchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchList);
  }

  @override
  String toString() {
    return 'Shop(id: $id, name: $name, open: $open, close: $close, comments: $comments, latitude: $latitude, longitude: $longitude, address: $address, tel: $tel, merchList: $merchList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._open, _open) &&
            const DeepCollectionEquality().equals(other._close, _close) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            const DeepCollectionEquality()
                .equals(other._merchList, _merchList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_open),
      const DeepCollectionEquality().hash(_close),
      const DeepCollectionEquality().hash(_comments),
      latitude,
      longitude,
      address,
      tel,
      const DeepCollectionEquality().hash(_merchList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopImplCopyWith<_$ShopImpl> get copyWith =>
      __$$ShopImplCopyWithImpl<_$ShopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopImplToJson(
      this,
    );
  }
}

abstract class _Shop implements Shop {
  const factory _Shop(
      {required final String id,
      @JsonKey(name: "shop_name") required final String name,
      @JsonKey(name: "shop_open") required final Map<String, String> open,
      @JsonKey(name: "shop_close") required final Map<String, String> close,
      required final Map<String, String> comments,
      required final double latitude,
      required final double longitude,
      @JsonKey(name: "shop_address") required final String address,
      @JsonKey(name: "shop_tel") required final String tel,
      required final List<MerchDetail> merchList}) = _$ShopImpl;

  factory _Shop.fromJson(Map<String, dynamic> json) = _$ShopImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "shop_name")
  String get name;
  @override
  @JsonKey(name: "shop_open")
  Map<String, String> get open;
  @override
  @JsonKey(name: "shop_close")
  Map<String, String> get close;
  @override
  Map<String, String> get comments;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: "shop_address")
  String get address;
  @override
  @JsonKey(name: "shop_tel")
  String get tel;
  @override
  List<MerchDetail> get merchList;
  @override
  @JsonKey(ignore: true)
  _$$ShopImplCopyWith<_$ShopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
