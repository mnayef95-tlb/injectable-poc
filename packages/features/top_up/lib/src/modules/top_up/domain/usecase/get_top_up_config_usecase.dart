import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/domain/entity/top_up_config.dart';
import 'package:top_up/src/modules/top_up/domain/top_up_repository.dart';

@injectable
class GetTopUpConfigUsecase {
  final TopUpRepository _topUpRepository;

  GetTopUpConfigUsecase(
    this._topUpRepository,
  );

  Future<TopUpConfig> call() async {
    return _topUpRepository.getConfig();
  }
}
