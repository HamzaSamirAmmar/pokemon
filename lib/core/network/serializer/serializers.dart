library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import '../models/base_response_model.dart';
import '../models/paginate_response_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  BaseResponseModel,
  // PaginateResponseModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
