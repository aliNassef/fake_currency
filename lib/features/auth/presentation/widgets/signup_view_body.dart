import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/helper/show_loading_box.dart';
import 'package:fake_currency/core/shared_widgets/custom_text_form_field.dart';
import 'package:fake_currency/core/shared_widgets/default_app_button.dart';
import 'package:fake_currency/core/shared_widgets/having_account.dart';
import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:fake_currency/features/auth/data/models/signup_input_model.dart'
    show SignupInputModel;
import 'package:fake_currency/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fake_currency/features/auth/presentation/view/login_view.dart';
import 'package:fake_currency/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/show_error_dialog.dart';
import '../../../../core/helper/toast_dialog.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late TextEditingController _name;
  late TextEditingController _email;
  late TextEditingController _password;
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
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
        _buildSignupForm(context),
      ],
    );
  }

  Widget _buildSignupForm(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoaded) {
          showToast(text: 'Signup successfully');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainView()),
            (route) => false,
          );
        }
        if (state is SignupLoading) {
          showLoadingBox(context);
        }

        if (state is SignupFailure) {
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
                    return 'Name is required';
                  }
                  return null;
                },
                hintText: 'Name',
                controller: _name,
              ),
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
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                hintText: 'Password',
                controller: _password,
              ),
              DefaultAppButton(
                text: 'Sign Up',
                onTap: () {
                  _signupButton(context);
                },
              ),
              HavingAccount(
                start: 'Do you have an account? ',
                end: 'Login',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signupButton(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var input = SignupInputModel(
        name: _name.text.trim(),
        email: _email.text.trim(),
        password: _password.text.trim(),
      );

      context.read<SignupCubit>().signup(input);
    } else {
      _autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
