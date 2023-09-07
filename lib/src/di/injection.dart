import 'package:di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:persistence/persistence.dart';
import 'package:top_up/top_up.dart';

import 'injection.config.dart';

@InjectableInit(
  externalPackageModulesAfter: [
    ExternalModule(PersistencePackageModule),
    ExternalModule(NetworkPackageModule),
    ExternalModule(TopUpPackageModule),
  ],
  throwOnMissingDependencies: true,
)
Future<void> configureDependencies({required String env}) async {
  await locator.init(environment: env);
}
