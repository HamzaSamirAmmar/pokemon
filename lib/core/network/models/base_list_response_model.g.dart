// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
        Map<String, dynamic> json) =>
    BaseListResponseModel<T>(
      count: json['count'] as int?,
      next: json['next'] as String?,
      data: (json['results'] as List<dynamic>?)
          ?.map((e) => _Converter<T>().fromJson(e as Object))
          .toList(),
    );

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
        BaseListResponseModel<T> instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'results': instance.data?.map(_Converter<T>().toJson).toList(),
    };
