import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/data/mapper/top_up_amount_suggestion_mapper.dart';
import 'package:top_up/src/modules/top_up/data/response/top_up_config_response.dart';
import 'package:top_up/src/modules/top_up/domain/entity/top_up_config.dart';

@injectable
class TopUpConfigMapper {
  final TopUpAmountSuggestionMapper _suggestionMapper;

  const TopUpConfigMapper({
    required TopUpAmountSuggestionMapper suggestionMapper,
  }) : _suggestionMapper = suggestionMapper;

  Future<TopUpConfig> map(TopUpConfigResponse source) async {
    return TopUpConfig(
      topUpSuggestions: _suggestionMapper.map(source.topUpSuggestions),
      minTopUpAmount: source.minTopUpAmount,
      maxTopUpAmount: source.maxTopUpAmount,
    );
  }
}
