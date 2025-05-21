
import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/shared_widgets/default_app_button.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.height * 0.1),
        Text(
          'Forgot password?',
          style: AppStyles.bold30.copyWith(color: AppColors.secondaryColor),
        ),
        SizedBox(height: 13.h),
        Text(
          'Don’t worry! It happens. Please enter the email associated with your account.',
          style: AppStyles.regular16.copyWith(color: AppColors.black),
        ),
        SizedBox(height: 38.h),
        Text(
          'Email address',
          style: AppStyles.regular14.copyWith(color: Colors.black),
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          hintText: 'Enter your email address',
          controller: TextEditingController(),
        ),
        SizedBox(height: 50.h),
        DefaultAppButton(
          text: 'Send code',
          onTap: () {},
        ),
      ],
    );
  }
}
