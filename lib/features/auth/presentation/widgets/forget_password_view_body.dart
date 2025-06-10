import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/helper/show_loading_box.dart';
import 'package:fake_currency/features/auth/presentation/view/verify_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/show_error_dialog.dart';
import '../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/shared_widgets/default_app_button.dart';
import '../cubits/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late TextEditingController emailController;
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.height * 0.1),
        Text(
          'Forgot password?',
          style: AppStyles.bold30.copyWith(color: AppColors.secondaryColor),
        ),
        SizedBox(height: 13.h),
        Text(
          'Don’t worry! It happens. Please enter the email associated with your account.',
          style: AppStyles.regular16.copyWith(color: AppColors.black),
        ),
        SizedBox(height: 38.h),
        Text(
          'Email address',
          style: AppStyles.regular14.copyWith(color: Colors.black),
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          hintText: 'Enter your email address',
          controller: emailController,
        ),
        SizedBox(height: 50.h),
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordLoaded) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => BlocProvider.value(
                        value: cubit,
                        child: VerifyCodeView(token: state.token),
                      ),
                ),
              );
            }

            if (state is ForgetPasswordFailure) {
              Navigator.pop(context);
              showErrorDialog(context, state.errMessage);
            }
            if (state is ForgetPasswordLoading) {
              showLoadingBox(context);
            }
          },
          child: DefaultAppButton(
            text: 'Send code',
            onTap: () {
              cubit.forgetPassword(emailController.text.trim());
            },
          ),
        ),
      ],
    );
  }
}
