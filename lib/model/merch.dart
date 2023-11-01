import 'package:freezed_annotation/freezed_annotation.dart';

part 'merch.freezed.dart';

part 'merch.g.dart';

@freezed
abstract class Merch with _$Merch {
  const factory Merch({
    required String id,
    required String name,
    required double minPrice, // 最低価格
    required double maxPrice, // 最高価格
    required double averagePrice, // 平均価格
    required String description, // 商品説明（「100gあたりの値段」など）
  }) = _Merch;

  factory Merch.fromJson(Map<String, dynamic> json) => _$MerchFromJson(json);
}
