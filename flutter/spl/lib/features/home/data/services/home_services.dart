import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spl/core/utils/classes/local_database/strings_shared_preferences_class.dart';
import 'package:spl/core/utils/constants/duration_variables_constant.dart';
import 'package:spl/core/utils/constants/string_variable_constant.dart';
import 'package:spl/core/utils/errors/failures.dart';

class HomeServices {
  final Dio dio;
  HomeServices({required this.dio}) {
    //i receive parameter in this Constructors and i do some things(inside {})
    dio.options.baseUrl = kBaseUrl;
    //when you use(dio.options..) dio package controll on all thing used dio, so in the bottom in this methods you don't need to give them baseUrl so just give them endPoint because dio will give them baseUrl automatically
    dio.options.connectTimeout = kThirtySeconds;
    //dio will wait just 30 seconds to connection in api
    dio.options.receiveTimeout = kThirtySeconds;
    //dio will wait just 30 seconds to receive anything from api
    dio.interceptors.add(
      //i use dio.interceptors because it's enable me to use asyncronous(to use await)
      InterceptorsWrapper(
        //InterceptorsWrapper this Widget enable me to use many of methods(onRequest(to do thing in request before sent it to api), onResponse(to do thing in response before return it to api), onError(to do thing when happen any error))
        onRequest: (options, handler) async {
          //options parameter: contain on full request like(method, headers, body, path,..)
          //handler: contain on(next(it's mean send this request), reject(it's mean cancel this request with an error), resolve(it's mean return fake response))
          final token =
              await StringsSharedPreferencesClass.getTokenMethodSharedPreferences(
                stringKey: kStringKeyTokenInSharedPreferences,
              );
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            //i told that options contain on full request and i edit on request(from add Bearer token to header if there is a token)
          }
          return handler.next(options);
          //so send this request to api
        },
      ),
    );
  }
  Future<Either<Failures, Response>> getMethodHomeServices({
    required String path,
  }) async {
    try {
      final response = await dio.get(path);
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorServer.fromDioException(dioException: e));
    } on Exception catch (e) {
      return Left(ErrorServer(errorMessageInFailuresClass: e.toString()));
    }
  }
}
