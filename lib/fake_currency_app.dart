import 'package:device_preview/device_preview.dart';
import 'package:fake_currency/core/di/injection.dart';
import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/features/auth/presentation/view/signup_view.dart';
import 'package:fake_currency/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeCurrency extends StatelessWidget {
  const FakeCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: AppColors.primaryColor,
            ),
            debugShowCheckedModeBanner: false,
            home: injector<SharedPreferences>().getString('token') != null ? const MainView() : const SignupView(),
          ),
    );
  }
}
