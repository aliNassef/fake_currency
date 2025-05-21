import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:fake_currency/core/shared_widgets/default_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
                'Reset password',
                style: AppStyles.bold30.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              SizedBox(height: 13.h),
              Text(
                'Please type something you’ll remember',
                style: AppStyles.regular16.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 38.h),
              Text(
                'New password',
                style: AppStyles.regular14.copyWith(color: Colors.black),
              ),
              SizedBox(height: 6.h),
              CustomTextFormField(
                isPassword: true,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Password is required';
                  }
                  if (p0.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                borderColor: Color(0xffD8DADC),
                hintText: 'must be 8 characters',
                controller: TextEditingController(),
              ),
              SizedBox(height: 100.h),
              DefaultAppButton(
                text: 'Reset password',
                onTap: () {},
              ),
            ],
          ).withHorizontalPadding(16),
        ),
      ),
    );
  }
}
