import 'package:fake_currency/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubits/signup_cubit/signup_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider(
        create: (context) => injector<SignupCubit>(),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(child: SignupViewBody()),
        ),
      ),
    );
  }
}
