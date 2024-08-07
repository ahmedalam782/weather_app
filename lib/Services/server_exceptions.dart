import 'package:dio/dio.dart';

import '../models/error_server_model.dart';

class ServerExceptions implements Exception {
  final ErrorServerModel errorServerModel;

  ServerExceptions({required this.errorServerModel});
}

void handleDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case 400: //Bad Request
          throw ServerExceptions(
            errorServerModel: ErrorServerModel.fromJson(error.response!.data),
          );
        case 401: //Unauthorized
          throw ServerExceptions(
            errorServerModel: ErrorServerModel.fromJson(error.response!.data),
          );
        case 403: //Forbidden
          throw ServerExceptions(
            errorServerModel: ErrorServerModel.fromJson(error.response!.data),
          );
        case 404: //Not Found
          throw ServerExceptions(
            errorServerModel: ErrorServerModel.fromJson(error.response!.data),
          );
        case 409: //Coefficient
          throw ServerExceptions(
            errorServerModel: ErrorServerModel.fromJson(error.response!.data),
          );
        case 422: //UnProcessable Entity
          throw ServerExceptions(
            errorServerModel: ErrorServerModel.fromJson(error.response!.data),
          );
        case 503: //Server Exception
          throw ServerExceptions(
            errorServerModel: ErrorServerModel.fromJson(error.response!.data),
          );
      }

    case DioExceptionType.connectionTimeout:
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(error.response!.data),
      );
    case DioExceptionType.connectionError:
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(error.response!.data),
      );
    case DioExceptionType.cancel:
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(error.response!.data),
      );
    case DioExceptionType.badCertificate:
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(error.response!.data),
      );
    case DioExceptionType.unknown:
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(error.response!.data),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(error.response!.data),
      );
    case DioExceptionType.sendTimeout:
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(error.response!.data),
      );
  }
}
