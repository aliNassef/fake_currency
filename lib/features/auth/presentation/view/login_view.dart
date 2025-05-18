import 'package:fake_currency/core/di/injection.dart';
import 'package:fake_currency/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubits/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider(
        create: (context) => injector<LoginCubit>(),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(child: LoginViewBody()),
        ),
      ),
    );
  }
}
