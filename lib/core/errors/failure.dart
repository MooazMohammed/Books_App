import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          message: "Sorry connection time out with api server",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Sorry send time out ");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Sorry recieve timed out");
      case DioExceptionType.badCertificate:
        return ServerFailure(message: "Sorry bad certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          message: "Sorry operation canceled, please try again later!",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          message: "Sorry Internet connection Error, please try again later!",
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          message: "Sorry connection unknoun, please try again later!",
        );
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 404) {
      return ServerFailure(
        message: "Your request was not found,please try later",
      );
    } else if (statuscode == 500) {
      return ServerFailure(
        message: "There is a problem with serve, please try later",
      );
    } else if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(message: response["error"]["message"]);
    } else {
      return ServerFailure(message: "Sorry ther was an error, please try again later");
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}
