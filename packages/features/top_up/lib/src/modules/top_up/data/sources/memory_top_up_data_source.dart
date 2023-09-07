import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/data/response/top_up_config_response.dart';

@injectable
class MemoryTopUpDataSource {
  TopUpConfigResponse? topUpConfigResponse;
}
