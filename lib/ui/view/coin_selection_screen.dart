import 'package:flutter/material.dart';
import '../../model/coin_ui_model_creator.dart';
import '../coinselection/coin_selection_view_model.dart';
import '../constants/app_constants.dart';
import '../theme/themes.dart';
import 'coin_list.dart';

class CoinSelectionScreen extends StatelessWidget {
  CoinSelectionScreen({Key? key}) : super(key: key);

  final CoinUiModelCreator modelCreator = CoinUiModelCreator();
  final CoinSelectionViewModel viewModel =
      CoinSelectionViewModel(coinModels: []);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: AppConstants.appFont,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppConstants.selectionScreenName,
            style: TextStyle(
                color: AppColors.accentColor2,
                fontFamily: AppConstants.appFont),
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
          child: CoinList(
            coinModels: modelCreator.coinUiModels,
            onTapCallback: (coinModel) {
              viewModel.navigateToCoinInfoScreen(context, coinModel);
            },
          ),
        ),
      ),
    );
  }
}
