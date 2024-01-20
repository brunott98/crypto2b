import 'package:flutter/material.dart';
import 'package:crypto2b/ui/constants/app_constants.dart';
import 'package:crypto2b/model/coin_data_model.dart';
import '../theme/themes.dart';

class CoinInfoList extends StatelessWidget {
  final List<CoinDataModel> coinDataList;

  const CoinInfoList({super.key, required this.coinDataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coinDataList.length,
      itemBuilder: (context, index) {
        var coinData = coinDataList[index];
        return Card(
          color: AppColors.barColor,
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              'Date: ${coinData.closeTime.toLocal()}',
              style: const TextStyle(
                fontFamily: AppConstants.appFont,
                color: AppColors.textColor,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Close Price: ${coinData.closePrice}',
                    style: const TextStyle(color: AppColors.textColor)),
                Text('Volume: ${coinData.volume}',
                    style: const TextStyle(color: AppColors.textColor)),
                Text('High Price: ${coinData.highPrice}',
                    style: const TextStyle(color: AppColors.textColor)),
                Text('Low Price: ${coinData.lowPrice}',
                    style: const TextStyle(color: AppColors.textColor)),
              ],
            ),
          ),
        );
      },
    );
  }
}
