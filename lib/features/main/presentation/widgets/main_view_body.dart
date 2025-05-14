import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:fake_currency/core/helper/image_picker_helper.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * .05),
        Text(
          'MCD',
          style: AppStyles.bold96.copyWith(color: AppColors.secondaryColor),
        ),
        SizedBox(height: context.height * .2),
        Row(
          spacing: 20.w,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => ImagePickerHelper.openCamera(onGet: (file) {}),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/camera_icon.svg'),
                      Text(
                        'Take a photo',
                        style: AppStyles.semibold32.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => ImagePickerHelper.openGallery(onGet: (file) {}),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/upload_icon.svg'),
                      Text(
                        'Upload a photo',
                        style: AppStyles.semibold32.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ).withHorizontalPadding(20),
      ],
    );
  }
}
