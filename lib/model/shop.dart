import 'package:freezed_annotation/freezed_annotation.dart';

import 'merch.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

@freezed
abstract class Shop with _$Shop {
  const factory Shop({
    required int id,
    required String name,
    required List<Merch> merchList,
  }) = _Shop;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
}