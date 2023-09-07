import 'package:json_annotation/json_annotation.dart';

part 'top_up_wallet_response.g.dart';

@JsonSerializable(createToJson: false)
class TopUpWalletResponse {
  final String? redirectUrl;
  final String? errorMessage;
  final int? errorCategory;

  const TopUpWalletResponse({
    this.redirectUrl,
    this.errorMessage,
    this.errorCategory,
  });

  factory TopUpWalletResponse.fromJson(Map<String, dynamic> json) =>
      _$TopUpWalletResponseFromJson(json);
}
