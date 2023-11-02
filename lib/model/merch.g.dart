// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchImpl _$$MerchImplFromJson(Map<String, dynamic> json) => _$MerchImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$MerchImplToJson(_$MerchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_$MerchDetailImpl _$$MerchDetailImplFromJson(Map<String, dynamic> json) =>
    _$MerchDetailImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MerchDetailImplToJson(_$MerchDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };
