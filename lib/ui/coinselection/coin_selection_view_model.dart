import 'package:flutter/material.dart';
import '../../model/coin_ui_model.dart';
import '../../navigation/crypto2b_navigation.dart';
import '../coindata/coin_info_view_model.dart';

class CoinSelectionViewModel {
  final List<CoinUiModel> coinModels;

  CoinSelectionViewModel({required this.coinModels});

  void navigateToCoinInfoScreen(BuildContext context, CoinUiModel coinModel) {
    CoinInfoViewModel coinInfoViewModel = CoinInfoViewModel();

    Nav.toCoinInfoScreen(context, coinModel, coinInfoViewModel);
  }
}
