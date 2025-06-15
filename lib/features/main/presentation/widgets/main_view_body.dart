import 'package:fake_currency/core/extensions/media_query_extension.dart';
import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:fake_currency/core/helper/image_picker_helper.dart';
import 'package:fake_currency/core/helper/show_error_dialog.dart';
import 'package:fake_currency/core/helper/show_loading_box.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:fake_currency/features/main/presentation/controller/cubit/main_cubit.dart';
import 'package:fake_currency/features/main/presentation/views/detection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, MainState>(
      listenWhen:
          (previous, current) =>
              current is MainSuccess ||
              current is MainError ||
              current is MainLoading,
      listener: (context, state) {
        if (state is MainSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      DetectionView(detectionModel: state. detectedClass, image: state.image),
            ),
            (route) => false,
          );
        }
        if (state is MainError) {
          showErrorDialog(context, state.errMessage);
        }
        if (state is MainLoading) {
          showLoadingBox(context);
        }
      },
      child: Column(
        children: [
          SizedBox(height: context.height * .05),
          Text(
            'MCD',
            style: AppStyles.bold96.copyWith(color: AppColors.secondaryColor),
          ),
          SizedBox(height: context.height * .16),
          Row(
            spacing: 20.w,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap:
                      () => ImagePickerHelper.openCamera(
                        onGet: (xfile) {
                          context.read<MainCubit>().detectCurrency(
                            image: xfile,
                          );
                        },
                      ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 240.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.secondaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: 5.h,
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
                  onTap:
                      () => ImagePickerHelper.openGallery(
                        onGet: (xfile) {
                          context.read<MainCubit>().detectCurrency(
                            image: xfile,
                          );
                        },
                      ),
                  child: Container(
                    height: 240.h,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.secondaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: 5.h,
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
      ),
    );
  }
}
