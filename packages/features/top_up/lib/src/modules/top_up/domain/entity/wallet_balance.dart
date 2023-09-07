import 'package:equatable/equatable.dart';

class WalletBalance extends Equatable {
  final double balanceAmount;

  const WalletBalance({
    required this.balanceAmount,
  });

  @override
  List<Object?> get props => [balanceAmount];
}
