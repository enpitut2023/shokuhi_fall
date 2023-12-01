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
abstract class MerchDetail implements _$MerchDetail {
  const MerchDetail._();
  const factory MerchDetail({
    required String id,
    required String name,
    required double sumPrice,
    required int count,
  }) = _MerchDetail;

  double averagePrice() {
    if (count == 0) {
      return 0;
    } else {
      return sumPrice / count;
    }
  }

  factory MerchDetail.fromJson(Map<String, dynamic> json) =>
      _$MerchDetailFromJson(json);
}

@freezed
class PostedMerch with _$PostedMerch {
  const factory PostedMerch({
    required String id,
    required String merchDetailId,
    required double price,
    required String date,
    String? description,
    String? imageUrl,
  }) = _PostedMerch;

  factory PostedMerch.fromJson(Map<String, dynamic> json) =>
      _$PostedMerchFromJson(json);
}
