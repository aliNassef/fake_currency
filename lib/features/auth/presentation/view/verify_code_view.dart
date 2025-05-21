import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:fake_currency/core/shared_widgets/default_app_button.dart';
import 'package:fake_currency/features/auth/presentation/widgets/pin_code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/send_code_timer.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Text(
                'Please check your email',
                style: AppStyles.bold30.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              SizedBox(height: 80.h),
              PinCodeField(),
              SizedBox(height: 40.h),
              DefaultAppButton(text: 'Verify', onTap: () {}),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SendCodeTimer(),
                ],
              ),
            ],
          ).withHorizontalPadding(16),
        ),
      ),
    );
  }
}
