import 'package:fake_currency/core/utils/app_colors.dart';
import 'package:fake_currency/features/main/presentation/widgets/main_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(child: MainViewBody()),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'Fake Currency Detection',
        style: AppStyles.medium24.copyWith(color: Color(0xFF3B4950)),
      ),
    );
  }
}
