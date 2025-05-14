import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/shared_widgets/custom_text_form_field.dart';
import 'package:fake_currency/core/shared_widgets/default_app_button.dart';
import 'package:fake_currency/core/shared_widgets/having_account.dart';
import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.1),
        Text(
          'MCD',
          style: AppStyles.bold96.copyWith(color: AppColors.secondaryColor),
        ),
        SizedBox(height: context.height * 0.1),
        _buildSignupForm(context),
      ],
    );
  }

  Container _buildSignupForm(BuildContext context) {
    return Container(
      height: context.height,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      decoration: BoxDecoration(
        color: AppColors.deepWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Column(
        spacing: 20.h,
        children: [
          SizedBox(height: 38.h),
          CustomTextFormField(hintText: 'Name'),
          CustomTextFormField(hintText: 'Email'),
          CustomTextFormField(hintText: 'Password'),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text(
                'Forgot Password?',
                style: AppStyles.medium20.copyWith(
                  color: AppColors.borderColor,
                ),
              ),
              onPressed: () {},
            ),
          ),
          DefaultAppButton(text: 'Sign Up', onTap: () {}),
          HavingAccount(
            start: 'Do you have an account? ',
            end: 'Login',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
