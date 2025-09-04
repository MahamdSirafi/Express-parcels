import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spl/core/utils/constants/duration_variables_constant.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/errors/failures.dart';

class TrackingServices {
  final Dio dio;
  TrackingServices({required this.dio}) {
    //i receive parameter in this Constructors and i do some things(inside {})
    dio.options.baseUrl = kBaseUrl;
    //when you use(dio.options..) dio package controll on all thing used dio, so in the bottom in this methods you don't need to give them baseUrl so just give them endPoint because dio will give them baseUrl automatically
    dio.options.connectTimeout = kThirtySeconds;
    //dio will wait just 30 seconds to connection in api
    dio.options.receiveTimeout = kThirtySeconds;
    //dio will wait just 30 seconds to receive anything from api
  }
  Future<Either<Failures, Response>> getParcelLocationServices({
    required String parcelId,
  }) async {
    try {
      final response = await dio.get('/parcels/$parcelId/location');
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorServer.fromDioException(dioException: e));
    } on Exception catch (e) {
      return Left(ErrorServer(errorMessageInFailuresClass: e.toString()));
    }
  }
}
