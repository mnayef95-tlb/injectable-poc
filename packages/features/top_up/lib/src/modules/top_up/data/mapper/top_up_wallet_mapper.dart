import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/data/response/top_up_wallet_response.dart';
import 'package:top_up/src/modules/top_up/domain/entity/top_up_wallet.dart';

@injectable
class TopUpWalletMapper {
  TopUpWallet map(TopUpWalletResponse source) {
    return TopUpWallet(
      redirectUrl: source.redirectUrl,
      errorMessage: source.errorMessage,
      errorCategory: source.errorCategory,
    );
  }
}
