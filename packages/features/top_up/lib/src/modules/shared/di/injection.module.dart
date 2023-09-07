//@GeneratedMicroModule;TopUpPackageModule;package:top_up/src/modules/shared/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:dio/dio.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;
import 'package:top_up/src/modules/top_up/data/mapper/top_up_amount_suggestion_mapper.dart'
    as _i6;
import 'package:top_up/src/modules/top_up/data/mapper/top_up_config_mapper.dart'
    as _i9;
import 'package:top_up/src/modules/top_up/data/mapper/top_up_wallet_mapper.dart'
    as _i12;
import 'package:top_up/src/modules/top_up/data/mapper/wallet_balance_mapper.dart'
    as _i13;
import 'package:top_up/src/modules/top_up/data/repositories/top_up_repository_impl.dart'
    as _i11;
import 'package:top_up/src/modules/top_up/data/sources/memory_top_up_data_source.dart'
    as _i3;
import 'package:top_up/src/modules/top_up/data/sources/remote_top_up_data_source.dart'
    as _i4;
import 'package:top_up/src/modules/top_up/domain/top_up_repository.dart'
    as _i10;
import 'package:top_up/src/modules/top_up/domain/usecase/get_top_up_config_usecase.dart'
    as _i14;
import 'package:top_up/src/modules/top_up/presentation/bloc/mock/top_up_bloc_mock.dart'
    as _i8;
import 'package:top_up/src/modules/top_up/presentation/bloc/top_up_bloc.dart'
    as _i7;

const String _test = 'test';
const String _prod = 'prod';

class TopUpPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.MemoryTopUpDataSource>(() => _i3.MemoryTopUpDataSource());
    gh.factory<_i4.RemoteTopUpDataSource>(() => _i4.RemoteTopUpDataSource(
          dio: gh<_i5.Dio>(),
          secureDio: gh<_i5.Dio>(instanceName: 'secureDio'),
        ));
    gh.factory<_i6.TopUpAmountSuggestionMapper>(
        () => _i6.TopUpAmountSuggestionMapper());
    gh.singleton<_i7.TopUpBloc>(
      _i8.MockTopUpBloc(),
      registerFor: {_test},
    );
    gh.factory<_i9.TopUpConfigMapper>(() => _i9.TopUpConfigMapper(
        suggestionMapper: gh<_i6.TopUpAmountSuggestionMapper>()));
    gh.factory<_i10.TopUpRepository>(() => _i11.TopUpRepositoryImpl(
          remoteDataSource: gh<_i4.RemoteTopUpDataSource>(),
          memoryDataSource: gh<_i3.MemoryTopUpDataSource>(),
          configMapper: gh<_i9.TopUpConfigMapper>(),
        ));
    gh.factory<_i12.TopUpWalletMapper>(() => _i12.TopUpWalletMapper());
    gh.factory<_i13.WalletBalanceMapper>(() => _i13.WalletBalanceMapper());
    gh.factory<_i14.GetTopUpConfigUsecase>(
        () => _i14.GetTopUpConfigUsecase(gh<_i10.TopUpRepository>()));
    gh.factory<_i7.TopUpBloc>(
      () => _i7.TopUpBloc(gh<_i14.GetTopUpConfigUsecase>()),
      registerFor: {_prod},
    );
  }
}
