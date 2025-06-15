import 'dart:io';

import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:fake_currency/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class DetectionViewBody extends StatelessWidget {
  const DetectionViewBody({
    super.key,
    required this.detectedCurrency,
    required this.image,
  });
  final String detectedCurrency;
  final XFile image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * .05),
        Container(
          height: context.height * .2,
          width: context.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(File(image.path)),
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
        ),
        SizedBox(height: 100),
        Text(detectedCurrency, style: AppStyles.bold28),
        SizedBox(height: context.height * .25),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainView()),
              (route) => false,
            );
          },
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff6494C5),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              spacing: 5.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Colors.white),
                Text(
                  'Verify Money',
                  style: AppStyles.semibold32.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
