import 'package:fake_currency/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(child: SignupViewBody()),
      ),
    );
  }
}