class CoinDataModel {
  final String coinName;
  final DateTime closeTime;
  final double closePrice;
  final double volume;
  final double highPrice;
  final double lowPrice;

  CoinDataModel({
    required this.coinName,
    required this.closeTime,
    required this.closePrice,
    required this.volume,
    required this.highPrice,
    required this.lowPrice,
  });
}
