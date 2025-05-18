import 'package:flutter/material.dart';
import 'package:fake_currency/core/utils/app_styles.dart';

void showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppStyles.medium20.copyWith(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ),
  );
}
