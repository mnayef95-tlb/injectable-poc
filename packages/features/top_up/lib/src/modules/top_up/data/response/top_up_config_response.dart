import 'package:json_annotation/json_annotation.dart';
import 'package:top_up/src/modules/top_up/data/response/top_up_amount_suggestion_response.dart';

part 'top_up_config_response.g.dart';

@JsonSerializable(createToJson: false)
class TopUpConfigResponse {
  @JsonKey(name: "topupSuggestions")
  final List<TopUpAmountSuggestionResponse> topUpSuggestions;

  @JsonKey(name: "minTopupAmount")
  final double minTopUpAmount;

  @JsonKey(name: "maxTopupAmount")
  final double maxTopUpAmount;

  const TopUpConfigResponse({
    required this.topUpSuggestions,
    required this.minTopUpAmount,
    required this.maxTopUpAmount,
  });

  factory TopUpConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$TopUpConfigResponseFromJson(json);
}
