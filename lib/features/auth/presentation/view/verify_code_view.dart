import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:fake_currency/core/shared_widgets/default_app_button.dart';
import 'package:fake_currency/features/auth/presentation/view/reset_password_view.dart';
import 'package:fake_currency/features/auth/presentation/widgets/pin_code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/show_error_dialog.dart';
import '../../../../core/helper/show_loading_box.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubits/forget_password_cubit/forget_password_cubit.dart';
import '../widgets/send_code_timer.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({super.key, required this.token});
  final String token;
  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  late TextEditingController _codeController;
  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Text(
                'Please check your email',
                style: AppStyles.bold30.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              SizedBox(height: 80.h),
              PinCodeField(controller: _codeController),
              SizedBox(height: 40.h),
              BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ForgetPasswordVerificationLoaded) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BlocProvider.value(
                              value: cubit,
                              child: ResetPasswordView(token: widget.token),
                            ),
                      ),
                    );
                  }
                if (state is ForgetPasswordVerificationFailure) {
                    Navigator.pop(context);
                    showErrorDialog(context, state.errMessage);
                  }
                  if (state is ForgetPasswordVerificationLoading) {
                    showLoadingBox(context);
                  }
                },
                child: DefaultAppButton(
                  text: 'Verify',
                  onTap: () {
                    context.read<ForgetPasswordCubit>().verificationCode(
                      _codeController.text.trim(),
                      widget.token,
                    );
                  },
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [SendCodeTimer()],
              ),
            ],
          ).withHorizontalPadding(16),
        ),
      ),
    );
  }
}
