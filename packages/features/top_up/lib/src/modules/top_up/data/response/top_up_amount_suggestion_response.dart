import 'package:json_annotation/json_annotation.dart';

part 'top_up_amount_suggestion_response.g.dart';

@JsonSerializable(createToJson: false)
class TopUpAmountSuggestionResponse {
  final double amount;

  const TopUpAmountSuggestionResponse({
    required this.amount,
  });

  factory TopUpAmountSuggestionResponse.fromJson(Map<String, dynamic> json) =>
      _$TopUpAmountSuggestionResponseFromJson(json);
}
