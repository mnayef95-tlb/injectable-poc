import 'package:top_up/src/modules/top_up/domain/entity/top_up_config.dart';

abstract class TopUpRepository {
  Future<TopUpConfig> getConfig();
}
