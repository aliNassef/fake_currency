import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:fake_currency/core/shared_widgets/default_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/show_error_dialog.dart';
import '../../../../core/helper/show_loading_box.dart';
import '../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubits/forget_password_cubit/forget_password_cubit.dart';
import 'login_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.token});
  final String token;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late TextEditingController _passwordController;
  @override
  void initState() {
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Text(
                'Reset password',
                style: AppStyles.bold30.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              SizedBox(height: 13.h),
              Text(
                'Please type something you’ll remember',
                style: AppStyles.regular16.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 38.h),
              Text(
                'New password',
                style: AppStyles.regular14.copyWith(color: Colors.black),
              ),
              SizedBox(height: 6.h),
              CustomTextFormField(
                isPassword: true,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Password is required';
                  }
                  if (p0.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                borderColor: Color(0xffD8DADC),
                hintText: 'must be 8 characters',
                controller: _passwordController,
              ),
              SizedBox(height: 100.h),
              BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ForgetPasswordResetLoaded) {
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                      (route) => false,
                    );
                  }
                  if (state is ForgetPasswordResetFailure) {
                    Navigator.pop(context);
                    showErrorDialog(context, state.errMessage);
                  }
                  if (state is ForgetPasswordResetLoading) {
                    showLoadingBox(context);
                  }
                },
                child: DefaultAppButton(
                  text: 'Reset password',
                  onTap: () {
                    context.read<ForgetPasswordCubit>().resetPassword(
                      _passwordController.text.trim(),
                      widget.token,
                    );
                  },
                ),
              ),
            ],
          ).withHorizontalPadding(16),
        ),
      ),
    );
  }
}
