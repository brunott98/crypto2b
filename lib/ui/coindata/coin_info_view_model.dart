import '../../data/coin_repo.dart';
import '../../model/coin_data_list_model.dart';
import '../../model/coin_data_model.dart';
import '../constants/coin_constants.dart';

class CoinRepoSingleton {
  static final CoinRepo _instance = CoinRepo();

  CoinRepo get instance => _instance;
}

class CoinInfoViewModel {
  final CoinRepo _coinRepo = CoinRepoSingleton().instance;

  String getSymbol(String coinName) {
    switch (coinName) {
      case CoinConstants.bnbCoinName:
        return 'BTCUSDT';
      case CoinConstants.btcCoinName:
        return 'BTCUSDT';
      case CoinConstants.ethCoinName:
        return 'ETHUSDT';
      default:
        return coinName;
    }
  }

  Future<List<CoinDataModel>> fetchCoinInfo(String coinName) async {
    try {
      String coinSymbol = getSymbol(coinName);

      final CoinDataList coinDataList =
      await _coinRepo.getCoinData(coinSymbol: coinSymbol);

      return coinDataList.coins;
    } catch (e) {
      throw CoinApiError();
    }
  }
}
