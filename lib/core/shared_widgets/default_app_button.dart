import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppButton extends StatelessWidget {
  const DefaultAppButton({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: context.width,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff6494C5),
        ),
        child: Text(
          text,
          style: AppStyles.bold28.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
