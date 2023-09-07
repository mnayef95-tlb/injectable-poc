import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/data/response/wallet_balance_response.dart';
import 'package:top_up/src/modules/top_up/domain/entity/wallet_balance.dart';

@injectable
class WalletBalanceMapper {
  WalletBalance map(WalletBalanceResponse source) {
    return WalletBalance(balanceAmount: source.balanceAmount);
  }
}
