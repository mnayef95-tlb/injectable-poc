import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:persistence/persistence.dart';

@injectable
class AuthenticationInterceptor extends Interceptor {
  final LocalPersistenceDataSource _localPersistenceDataSource;

  const AuthenticationInterceptor({
    required LocalPersistenceDataSource localPersistenceDataSource,
  }) : _localPersistenceDataSource = localPersistenceDataSource;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("Before adding token: ${options.headers}");
    final token = _localPersistenceDataSource.getAuthToken();
    options.headers.addAll({
      if (token != null) "Authorization": "Bearer $token",
    });
    print("After adding token: ${options.headers}");
    super.onRequest(options, handler);
  }
}
