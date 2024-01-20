import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/coin_data_list_model.dart';
import '../model/coin_data_model.dart';

class CoinRepo {
  static const String baseUrl = 'https://api.binance.com/api/v3/klines';

  Future<CoinDataList> getCoinData({required String coinSymbol}) async {
    final Map<String, String> params = {
      'symbol': coinSymbol,
      'interval': '1d',
      'limit': '100',
    };

    final Uri uri = Uri.parse(baseUrl).replace(queryParameters: params);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);

      final List<CoinDataModel> coinDataList = responseData
          .map((data) => CoinDataModel(
        coinName: coinSymbol,
        closeTime: DateTime.fromMillisecondsSinceEpoch(data[0]),
        closePrice: double.parse(data[4]),
        volume: double.parse(data[5]),
        highPrice: double.parse(data[2]),
        lowPrice: double.parse(data[3]),
      ))
          .toList();

      coinDataList.sort((a, b) => b.closeTime.compareTo(a.closeTime));

      return CoinDataList(coins: coinDataList);
    } else {
      throw CoinApiError();
    }
  }
}
