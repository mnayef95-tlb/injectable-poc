//@GeneratedMicroModule;PersistencePackageModule;package:persistence/src/persistence/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:persistence/src/persistence/di/persistence_module.dart' as _i5;
import 'package:persistence/src/persistence/local_persistence_data_source.dart'
    as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

class PersistencePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    final persistenceModule = _$PersistenceModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => persistenceModule.injectSharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i4.LocalPersistenceDataSource>(() =>
        _i4.LocalPersistenceDataSource(
            sharedPreferences: gh<_i3.SharedPreferences>()));
  }
}

class _$PersistenceModule extends _i5.PersistenceModule {}
