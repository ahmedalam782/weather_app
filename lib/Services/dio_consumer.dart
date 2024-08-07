import 'package:dio/dio.dart';
import 'package:weather_app/Services/server_exceptions.dart';

import 'api_consumer.dart';

class DioConsumer extends APIConsumer {
  final Dio dio;

  DioConsumer({
    required this.dio,
  });

  @override
  Future getData(String path,
      {Map<String, dynamic>? queryParameters, Object? data}) async {
    try {
      final response =
          await dio.get(path, queryParameters: queryParameters, data: data);
      return response;
    } on DioException catch (error) {
      handleDioException(error);
    }
  }
}
