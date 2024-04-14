// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../domain/news/entities/news_hit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsHitImpl _$$NewsHitImplFromJson(Map<String, dynamic> json) =>
    _$NewsHitImpl(
      url: json['url'] as String?,
      points: json['points'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$NewsHitImplToJson(_$NewsHitImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'points': instance.points,
      'title': instance.title,
    };
