//@GeneratedMicroModule;NetworkPackageModule;package:network/src/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:dio/dio.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;
import 'package:network/network.dart' as _i6;
import 'package:network/src/di/network_module.dart' as _i8;
import 'package:network/src/interceptors/authentication_interceptor.dart'
    as _i3;
import 'package:network/src/interceptors/observability_interceptor.dart' as _i7;
import 'package:persistence/persistence.dart' as _i4;

class NetworkPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    gh.factory<_i3.AuthenticationInterceptor>(() =>
        _i3.AuthenticationInterceptor(
            localPersistenceDataSource: gh<_i4.LocalPersistenceDataSource>()));
    gh.factory<_i5.BaseOptions>(() => networkModule.injectBaseOptions());
    gh.singleton<_i5.Dio>(
      networkModule.injectSecureDio(
        gh<_i5.BaseOptions>(),
        gh<_i6.AuthenticationInterceptor>(),
      ),
      instanceName: 'secureDio',
    );
    gh.factory<_i7.ObservabilityInterceptor>(
        () => _i7.ObservabilityInterceptor());
    gh.singleton<_i5.Dio>(networkModule.injectDio(
      gh<_i5.BaseOptions>(),
      gh<_i6.ObservabilityInterceptor>(),
      gh<_i6.AuthenticationInterceptor>(),
    ));
  }
}

class _$NetworkModule extends _i8.NetworkModule {}
