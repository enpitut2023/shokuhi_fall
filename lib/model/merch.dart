import 'package:freezed_annotation/freezed_annotation.dart';

part 'merch.freezed.dart';

part 'merch.g.dart';

// 商品
@freezed
abstract class MerchOutline with _$MerchOutline {
  const factory MerchOutline({
    required String id,
    required String name,
    required String tag, // タグ（「野菜」など）
    String? description, // 商品説明（「100gあたりの値段」など）
  }) = _Merch;

  factory MerchOutline.fromJson(Map<String, dynamic> json) =>
      _$MerchOutlineFromJson(json);
}

// 商品詳細
@freezed
abstract class MerchDetail with _$MerchDetail {
  const factory MerchDetail({
    required String id,
    required String name,
    double? minPrice, // 最低価格
    double? maxPrice, // 最高価格
  }) = _MerchDetail;

  factory MerchDetail.fromJson(Map<String, dynamic> json) =>
      _$MerchDetailFromJson(json);
}

@freezed
class PostedMerch with _$PostedMerch {
  const factory PostedMerch({
    required String id,
    required String merchDetailId,
    required double price,
    String? description,
    String? imageUrl,
  }) = _PostedMerch;

  factory PostedMerch.fromJson(Map<String, dynamic> json) =>
      _$PostedMerchFromJson(json);
}
