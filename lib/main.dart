import 'package:fake_currency/core/di/injection.dart';
import 'package:fake_currency/fake_currency_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper/custom_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();
  Bloc.observer = CustomBlocObserver();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const FakeCurrency(),
    ),
  );
}
