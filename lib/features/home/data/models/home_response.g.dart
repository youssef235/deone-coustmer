// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServicesResponseImpl _$$ServicesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServicesResponseImpl(
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      slides:
          (json['slides'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ServicesResponseImplToJson(
        _$ServicesResponseImpl instance) =>
    <String, dynamic>{
      'services': instance.services,
      'slides': instance.slides,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      created_at: json['created_at'] as String?,
      has_two_location: json['has_two_location'] as String?,
      icon: json['icon'] == null
          ? null
          : ServiceIcon.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'created_at': instance.created_at,
      'has_two_location': instance.has_two_location,
      'icon': instance.icon,
    };

_$ServiceIconImpl _$$ServiceIconImplFromJson(Map<String, dynamic> json) =>
    _$ServiceIconImpl(
      id: json['id'] as int?,
      url: json['url'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$ServiceIconImplToJson(_$ServiceIconImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'type': instance.type,
    };
