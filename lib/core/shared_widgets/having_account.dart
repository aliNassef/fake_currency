
import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HavingAccount extends StatelessWidget {
  const HavingAccount({
    super.key,
    required this.start,
    required this.end,
    required this.onTap,
  });
  final VoidCallback onTap;
  final String start;
  final String end;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: start,
            style: AppStyles.medium20.copyWith(color: Colors.black),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: end,
            style: AppStyles.medium20.copyWith(
              color: AppColors.borderColor,
            ),
          ),
        ],
      ),
    );
  }
}
