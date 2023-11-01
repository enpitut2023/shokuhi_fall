// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchImpl _$$MerchImplFromJson(Map<String, dynamic> json) => _$MerchImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      minPrice: (json['minPrice'] as num).toDouble(),
      maxPrice: (json['maxPrice'] as num).toDouble(),
      averagePrice: (json['averagePrice'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$MerchImplToJson(_$MerchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'averagePrice': instance.averagePrice,
      'description': instance.description,
    };
