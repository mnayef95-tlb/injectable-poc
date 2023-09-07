import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio injectDio(
    BaseOptions baseOptions,
    ObservabilityInterceptor observabilityInterceptor,
    AuthenticationInterceptor authenticationInterceptor,
  ) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(observabilityInterceptor);
    dio.interceptors.add(authenticationInterceptor);
    return dio;
  }

  @secureDio
  @singleton
  Dio injectSecureDio(
    BaseOptions baseOptions,
    AuthenticationInterceptor authenticationInterceptor,
  ) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(authenticationInterceptor);
    return dio;
  }

  @injectable
  BaseOptions injectBaseOptions() {
    return BaseOptions(baseUrl: "https://talabat.com/api/v1/");
  }
}
