library base_response_model;

import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../error/exceptions.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel<T> {
  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'message')
  final dynamic message;

  @JsonKey(name: 'data', fromJson: _dataFromJson, toJson: _dataToJson)
  final T? data;

  BaseResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson<T>(json);
  }
}

T? _dataFromJson<T>(Object? data) {
  debugPrint('_dataFromJson: T is ${T.toString()}\n');

  /// if the data is null or the data is not important
  if (data == null ||
      T.toString() == 'void' ||
      (data is List<dynamic> && data.isEmpty)) {
    debugPrint('BaseResponseModel: Data is null\n');
    return null;
  }

  /// else if the data not null so it should be a Map
  else if (data is Map<String, dynamic>) {
    /***  Model ***/
    // if (T.toString() == Model.className) {
    //   return Model.fromJson(data) as T;
    // }
  }

  debugPrint('_dataFromJson: parse error (BaseResponseModel)');
  throw ParseException();
}

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S? other1, U? other2]) => {
      'data': input,
    };
