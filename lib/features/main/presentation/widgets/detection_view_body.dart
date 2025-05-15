import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetectionViewBody extends StatelessWidget {
  const DetectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * .05),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/two_hundred.png'),
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
        ),
        SizedBox(height: context.height * .25),
        Container(
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
      ],
    );
  }
}
