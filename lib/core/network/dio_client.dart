import 'package:deal_sell/core/config/env_config.dart';
import 'package:deal_sell/core/services/cache_services.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late final Dio _dio;

  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: EnvConfig.instance.apiBaseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    headers: {'Content': 'application/json', 'Accept': 'application/json'},
  );

  DioClient() {
    _dio = Dio(_baseOptions);
    _addIntercetos();
  }

  Dio get dio => _dio;

  void _addIntercetos() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await CacheServices.instance.getAuthToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        // onError: (DioException error, handler) async {
        //   // if (error.response?.statusCode == 401) {
        //   //   if (await _refreshToken()) {
        //   //     return handler.resolve(await _retry(error.requestOptions));
        //   //   }
        //   // }
        //   return handler.next(error);
        // },
      ),
    );
  }
}
