
import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        border: _buildBorderStyle(),
        enabledBorder: _buildBorderStyle(),
        focusedBorder: _buildBorderStyle(),
        hintText: hintText,
        hintStyle: AppStyles.medium24.copyWith(color: AppColors.black),
      ),
    );
  }

  OutlineInputBorder _buildBorderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.borderColor.withValues(alpha: 0.7),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
