import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      validator: (value) {
        if (value!.length < 6) {
          return 'Please enter a valid pin';
        }
        return null;
      },
      controller: controller,
      length: 6,
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: AppStyles.medium24.copyWith(color: Colors.black),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffD8DADC)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      errorPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: AppStyles.medium24.copyWith(color: Colors.black),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
