import 'package:crypto2b/ui/constants/error_constants.dart';
import 'package:flutter/material.dart';

class CoinApiUiError extends StatelessWidget {
  const CoinApiUiError({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(ApiErrorConstants.errorTitle),
      content: const Text(ApiErrorConstants.errorMessage),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(ApiErrorConstants.errorConfirmation),
        ),
      ],
    );
  }
}
