// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
        Map<String, dynamic> json) =>
    BaseListResponseModel<T>(
      status: json['status'] as String?,
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => _Converter<T>().fromJson(e as Object))
          .toList(),
    );

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
        BaseListResponseModel<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map(_Converter<T>().toJson).toList(),
    };
