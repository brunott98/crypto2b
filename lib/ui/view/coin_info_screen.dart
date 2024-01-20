import 'package:flutter/material.dart';
import 'package:crypto2b/ui/constants/app_constants.dart';
import 'package:crypto2b/model/coin_ui_model.dart';
import 'package:crypto2b/ui/theme/themes.dart';
import '../../model/coin_data_model.dart';
import '../coindata/coin_info_view_model.dart';
import 'coin_api_error.dart';
import 'coin_info_list.dart';

class CoinInfoScreen extends StatelessWidget {
  final CoinUiModel coinModel;
  final CoinInfoViewModel viewModel;

  const CoinInfoScreen(
      {Key? key, required this.coinModel, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          coinModel.coinName,
          style: const TextStyle(
            fontFamily: AppConstants.appFont,
            color: AppColors.accentColor2,
          ),
        ),
        backgroundColor: AppColors.barColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.accentColor2,
              AppColors.accentColor1,
            ],
          ),
        ),
        child: FutureBuilder(
          future: viewModel.fetchCoinInfo(coinModel.coinName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: CoinApiUiError(),
              );
            } else if (snapshot.hasData) {
              var coinDataList = snapshot.data as List<CoinDataModel>;
              return CoinInfoList(coinDataList: coinDataList);
            } else {

              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
