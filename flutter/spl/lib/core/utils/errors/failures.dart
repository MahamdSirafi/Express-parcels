import 'package:dio/dio.dart';

class Failures {
  final String errorMessageInFailuresClass;
  Failures({required this.errorMessageInFailuresClass});
}

class ErrorServer extends Failures {
  ErrorServer({required super.errorMessageInFailuresClass});
  factory ErrorServer.fromDioException({required DioException dioException}) {
    return switch (dioException.type) {
      DioExceptionType.connectionTimeout => ErrorServer(
        errorMessageInFailuresClass:
            'Error: the connection take big time, please try later',
      ),
      DioExceptionType.sendTimeout => ErrorServer(
        errorMessageInFailuresClass:
            'Error: the send take big time, please try later',
      ),
      DioExceptionType.receiveTimeout => ErrorServer(
        errorMessageInFailuresClass:
            'Error: the receive take big time, please try later',
      ),
      DioExceptionType.badCertificate => ErrorServer(
        errorMessageInFailuresClass:
            'Error: the certification is very bad, please try again',
      ),
      DioExceptionType.badResponse => ErrorServer.fromBadResponse(
        response: dioException.response?.data,
        statusCode: dioException.response?.statusCode ?? 501,
      ),
      DioExceptionType.cancel => ErrorServer(
        errorMessageInFailuresClass: 'Error: the request is cancel',
      ),
      DioExceptionType.connectionError => ErrorServer(
        errorMessageInFailuresClass:
            'Error: your network is weak, please try later',
      ),
      DioExceptionType.unknown => ErrorServer(
        errorMessageInFailuresClass:
            'Error: oops there was an unknown error, please try again',
      ),
    };
  }
  factory ErrorServer.fromBadResponse({
    required dynamic response,
    required int statusCode,
  }) {
    return switch (statusCode) {
      400 => ErrorServer(
        errorMessageInFailuresClass:
            'Error: ${response['message']}, please try again',
      ),
      401 => ErrorServer(
        errorMessageInFailuresClass:
            'Error: ${response['message']}, please try again',
      ),
      403 => ErrorServer(
        errorMessageInFailuresClass:
            'Error: ${response['message']}, please try again',
      ),
      404 => ErrorServer(
        errorMessageInFailuresClass:
            'Error: your request not found, please try again',
      ),
      500 => ErrorServer(
        errorMessageInFailuresClass:
            'Error: there was an error from internal server, please try later',
      ),
      _ => ErrorServer(
        errorMessageInFailuresClass:
            'Error: oops there was an unexpected error, please try again',
      ),
      //underscore(_) it's like default in switch case
    };
  }
}
