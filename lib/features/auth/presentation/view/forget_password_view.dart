import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:fake_currency/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../features/auth/presentation/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<ForgetPasswordCubit>(),
          child: SingleChildScrollView(
            child: ForgetPasswordViewBody().withHorizontalPadding(20),
          ),
        ),
      ),
    );
  }
}
