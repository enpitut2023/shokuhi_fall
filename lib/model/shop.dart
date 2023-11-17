// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'merch.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

@freezed
abstract class Shop with _$Shop {
  const factory Shop({
    required String id,
    @JsonKey(name: "shop_name") required String name,
    @JsonKey(name: "shop_open") required Map<String, String> open,
    @JsonKey(name: "shop_close") required Map<String, String> close,
    required Map<String, String> comments,
    required double latitude,
    required double longitude,
    @JsonKey(name: "shop_address") required String address,
    @JsonKey(name: "shop_tel") required String tel,
    required List<MerchDetail> merchList,
  }) = _Shop;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}
