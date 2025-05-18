import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> showLoadingBox(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      );
    },
  );
}
