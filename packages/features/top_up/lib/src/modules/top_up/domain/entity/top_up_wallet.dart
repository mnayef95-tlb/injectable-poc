import 'package:equatable/equatable.dart';

class TopUpWallet extends Equatable {
  final String? redirectUrl;
  final String? errorMessage;
  final int? errorCategory;

  const TopUpWallet({
    this.redirectUrl,
    this.errorMessage,
    this.errorCategory,
  });

  @override
  List<Object?> get props => [redirectUrl, errorMessage, errorCategory];
}
