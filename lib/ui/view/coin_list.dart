import 'package:flutter/material.dart';
import '../../model/coin_ui_model.dart';
import '../constants/app_constants.dart';
import '../theme/themes.dart';

class CoinList extends StatelessWidget {

  final List<CoinUiModel> coinModels;
  final Function(CoinUiModel) onTapCallback;

  const CoinList(
      {Key? key, required this.coinModels, required this.onTapCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coinModels.length,
      itemBuilder: (context, index) {
        final coinModel = coinModels[index];
        return GestureDetector(
          onTap: () {
            onTapCallback(coinModel);
          },
          child: Card(
            color: AppColors.barColor,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                coinModel.coinIconPath,
                width: 50.0,
                height: 50.0,
              ),
              title: Text(
                coinModel.coinName,
                style: const TextStyle(
                  fontFamily: AppConstants.appFont,
                  color: AppColors.textColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
