import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/data/response/top_up_amount_suggestion_response.dart';
import 'package:top_up/src/modules/top_up/domain/entity/top_up_amount_suggestion.dart';

@injectable
class TopUpAmountSuggestionMapper {
  List<TopUpAmountSuggestion> map(List<TopUpAmountSuggestionResponse> source) {
    return source.map((suggestion) {
      return TopUpAmountSuggestion(
        amount: suggestion.amount,
        selected: false,
      );
    }).toList();
  }
}
