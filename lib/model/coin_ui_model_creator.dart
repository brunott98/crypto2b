import '../ui/constants/coin_constants.dart';
import 'coin_ui_model.dart';

class CoinUiModelCreator {
  final List<CoinUiModel> coinUiModels = [
    CoinUiModel(
        coinName: CoinConstants.bnbCoinName,
        coinIconPath: CoinConstants.bnbIconPath),
    CoinUiModel(
        coinName: CoinConstants.btcCoinName,
        coinIconPath: CoinConstants.btcIconPath),
    CoinUiModel(
        coinName: CoinConstants.ethCoinName,
        coinIconPath: CoinConstants.ethIconPath),
  ];
}
