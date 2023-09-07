import 'package:equatable/equatable.dart';
import 'package:top_up/src/modules/top_up/domain/entity/top_up_amount_suggestion.dart';

class TopUpConfig extends Equatable {
  final List<TopUpAmountSuggestion> topUpSuggestions;
  final double minTopUpAmount;
  final double maxTopUpAmount;

  const TopUpConfig({
    required this.topUpSuggestions,
    required this.minTopUpAmount,
    required this.maxTopUpAmount,
  });

  @override
  List<Object?> get props => [
        topUpSuggestions,
        minTopUpAmount,
        maxTopUpAmount,
      ];

  TopUpConfig copyWith({
    List<TopUpAmountSuggestion>? topUpSuggestions,
    double? minTopUpAmount,
    double? maxTopUpAmount,
  }) {
    return TopUpConfig(
      topUpSuggestions: topUpSuggestions ?? this.topUpSuggestions,
      minTopUpAmount: minTopUpAmount ?? this.minTopUpAmount,
      maxTopUpAmount: maxTopUpAmount ?? this.maxTopUpAmount,
    );
  }
}
