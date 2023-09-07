import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ObservabilityInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Log data to NR
    print("Start observability for ${options.uri}");
    super.onRequest(options, handler);
  }
}
