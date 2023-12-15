// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchImpl _$$MerchImplFromJson(Map<String, dynamic> json) => _$MerchImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      tag: json['tag'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$MerchImplToJson(_$MerchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'description': instance.description,
    };

_$MerchDetailImpl _$$MerchDetailImplFromJson(Map<String, dynamic> json) =>
    _$MerchDetailImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      sumPrice: (json['sumPrice'] as num).toDouble(),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$MerchDetailImplToJson(_$MerchDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sumPrice': instance.sumPrice,
      'count': instance.count,
    };

_$PostedMerchImpl _$$PostedMerchImplFromJson(Map<String, dynamic> json) =>
    _$PostedMerchImpl(
      id: json['id'] as String,
      merchDetailId: json['merchDetailId'] as String,
      price: (json['price'] as num).toDouble(),
      date: json['date'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$PostedMerchImplToJson(_$PostedMerchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'merchDetailId': instance.merchDetailId,
      'price': instance.price,
      'date': instance.date,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
