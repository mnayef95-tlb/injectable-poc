import 'package:equatable/equatable.dart';

class TopUpAmountSuggestion extends Equatable {
  final double amount;
  final bool selected;

  const TopUpAmountSuggestion({
    required this.amount,
    required this.selected,
  });

  @override
  List<Object?> get props => [amount, selected];

  TopUpAmountSuggestion copyWith({
    double? amount,
    bool? selected,
  }) {
    return TopUpAmountSuggestion(
      amount: amount ?? this.amount,
      selected: selected ?? this.selected,
    );
  }
}
