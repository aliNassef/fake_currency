import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.borderColor,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;
  final Color? borderColor ;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: '●',
      obscureText: widget.isPassword ? isSecure : !isSecure,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        border: _buildBorderStyle(),
        enabledBorder: _buildBorderStyle(),
        focusedBorder: _buildBorderStyle(),
        hintText: widget.hintText,
        hintStyle: AppStyles.regular16.copyWith(color: AppColors.black),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                  icon:
                      isSecure
                          ? const Icon(
                            Icons.visibility_off,
                            color: AppColors.borderColor,
                          )
                          : const Icon(
                            Icons.visibility_sharp,
                            color: AppColors.borderColor,
                          ),
                )
                : const SizedBox(),
      ),
    );
  }

  OutlineInputBorder _buildBorderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.borderColor == null ? AppColors.borderColor.withValues(alpha: 0.7) : widget.borderColor!,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
