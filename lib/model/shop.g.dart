// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopImpl _$$ShopImplFromJson(Map<String, dynamic> json) => _$ShopImpl(
      id: json['id'] as String,
      name: json['shop_name'] as String,
      open: Map<String, String>.from(json['shop_open'] as Map),
      close: Map<String, String>.from(json['shop_close'] as Map),
      comments: Map<String, String>.from(json['comments'] as Map),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['shop_address'] as String,
      tel: json['shop_tel'] as String,
      merchList: (json['merchList'] as List<dynamic>)
          .map((e) => MerchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShopImplToJson(_$ShopImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shop_name': instance.name,
      'shop_open': instance.open,
      'shop_close': instance.close,
      'comments': instance.comments,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'shop_address': instance.address,
      'shop_tel': instance.tel,
      'merchList': instance.merchList,
    };
