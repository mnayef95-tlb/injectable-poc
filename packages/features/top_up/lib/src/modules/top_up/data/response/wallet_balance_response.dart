import 'package:json_annotation/json_annotation.dart';

part 'wallet_balance_response.g.dart';

@JsonSerializable(createToJson: false)
class WalletBalanceResponse {
  final double balanceAmount;

  const WalletBalanceResponse({
    required this.balanceAmount,
  });

  factory WalletBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceResponseFromJson(json);
}
