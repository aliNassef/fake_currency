import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../../../../features/auth/presentation/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ForgetPasswordViewBody().withHorizontalPadding(20),
        ),
      ),
    );
  }
}
