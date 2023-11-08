import 'package:freezed_annotation/freezed_annotation.dart';

part 'merch.freezed.dart';

part 'merch.g.dart';

@freezed
abstract class MerchOutline with _$MerchOutline {
  const factory MerchOutline({
    required String id,
    required String name,
    String? description, // 商品説明（「100gあたりの値段」など）
  }) = _Merch;

  factory MerchOutline.fromJson(Map<String, dynamic> json) => _$MerchOutlineFromJson(json);
}

@freezed
abstract class MerchDetail with _$MerchDetail {
  const factory MerchDetail({
    required String id,
    required String name,
    double? minPrice, // 最低価格
    double? maxPrice, // 最高価格
  }) = _MerchDetail;

  factory MerchDetail.fromJson(Map<String, dynamic> json) => _$MerchDetailFromJson(json);
}