import 'package:fake_currency/core/extensions/padding_extension.dart';
import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../widgets/detection_view_body.dart';

class DetectionView extends StatelessWidget {
  const DetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DetectionViewBody().withHorizontalPadding(20),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Text(
        'Currency Upload',
        style: AppStyles.medium24.copyWith(color: Color(0xff3B4950)),
      ),
    );
  }
}
