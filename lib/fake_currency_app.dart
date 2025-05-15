import 'package:device_preview/device_preview.dart';
import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/features/main/presentation/views/detection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            home: const DetectionView(),
          ),
    );
  }
}
