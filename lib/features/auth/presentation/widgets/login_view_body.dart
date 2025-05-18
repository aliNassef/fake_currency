import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/shared_widgets/custom_text_form_field.dart';
import 'package:fake_currency/core/shared_widgets/having_account.dart';
import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:fake_currency/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fake_currency/features/auth/presentation/view/signup_view.dart';
import 'package:fake_currency/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/show_error_dialog.dart';
import '../../../../core/helper/show_loading_box.dart';
import '../../../../core/shared_widgets/default_app_button.dart';
import '../../data/models/login_input_model.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController _email;
  late TextEditingController _password;
  late AutovalidateMode _autovalidateMode;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _autovalidateMode = AutovalidateMode.disabled;
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.1),
        Text(
          'MCD',
          style: AppStyles.bold96.copyWith(color: AppColors.secondaryColor),
        ),
        SizedBox(height: context.height * 0.1),
        _buildLoginForm(context),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainView()),
            (route) => false,
          );
        }
        if (state is LoginLoading) {
          showLoadingBox(context);
        }

        if (state is LoginFailure) {
          Navigator.pop(context);
          showErrorDialog(context, state.errMessage);
        }
      },
      child: Container(
        height: context.height,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: context.width,
        decoration: BoxDecoration(
          color: AppColors.deepWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            spacing: 20.h,
            children: [
              SizedBox(height: 38.h),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                hintText: 'Email',
                controller: _email,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                hintText: 'Password',
                isPassword: true,
                controller: _password,
              ),
              _buildForgetPassButton(),
              DefaultAppButton(
                text: 'Login',
                onTap: () {
                  _loginButton(context);
                },
              ),
              HavingAccount(
                start: 'Don\'t have an account? ',
                end: 'Register',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignupView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginButton(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var input = LoginInputModel(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );

      context.read<LoginCubit>().login(input);
    } else {
      _autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  Align _buildForgetPassButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          'Forgot Password?',
          style: AppStyles.medium20.copyWith(color: AppColors.borderColor),
        ),
        onPressed: () {},
      ),
    );
  }
}
