import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spl/core/utils/constants/duration_variables_constant.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/errors/failures.dart';

class AuthServices {
  final Dio dio;
  AuthServices({required this.dio}) {
    //i receive parameter in this Constructors and i do some things(inside {})
    dio.options.baseUrl = kBaseUrl;
    //when you use(dio.options..) dio package controll on all thing used dio, so in the bottom in this methods you don't need to give them baseUrl so just give them endPoint because dio will give them baseUrl automatically
    dio.options.connectTimeout = kThirtySeconds;
    //dio will wait just 30 seconds to connection in api
    dio.options.receiveTimeout = kThirtySeconds;
    //dio will wait just 30 seconds to receive anything from api
  }
  Future<Either<Failures, Response>> getMethodAuthServices({
    required String path,
    required Map<String, dynamic> queryParameter,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameter);
      //queryParameter receive data from api and you can don't write it but it's make your code more clean and this is shape it
      //queryParameters: {'phone': phone,'name': name,}
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorServer.fromDioException(dioException: e));
    } on Exception catch (e) {
      return Left(ErrorServer(errorMessageInFailuresClass: e.toString()));
    }
  }

  Future<Either<Failures, Response>> postMethodAuthServices({
    required String path,
    required dynamic data,
  }) async {
    try {
      final response = await dio.post(path, data: data);
      //you should use post request to send data to api and get on result from send this data like authentication and you will get on result this auth operation
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorServer.fromDioException(dioException: e));
    } on Exception catch (e) {
      return Left(ErrorServer(errorMessageInFailuresClass: e.toString()));
    }
  }

  Future<Either<Failures, Response>> patchMethodAuthServices({
    required String path,
    required dynamic data,
  }) async {
    try {
      final response = await dio.patch(path, data: data);
      //you should use patch request when you edit on part just not all thing like change password just
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorServer.fromDioException(dioException: e));
    } on Exception catch (e) {
      return Left(ErrorServer(errorMessageInFailuresClass: e.toString()));
    }
  }
}
