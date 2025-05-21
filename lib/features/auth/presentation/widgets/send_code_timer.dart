import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SendCodeTimer extends StatefulWidget {
  final VoidCallback? onResendPressed;
  const SendCodeTimer({super.key, this.onResendPressed});

  @override
  State<SendCodeTimer> createState() => _SendCodeTimerState();
}

class _SendCodeTimerState extends State<SendCodeTimer> {
  late Timer _timer;
  int _secondsRemaining = 30;
  bool _isButtonEnabled = false;
  bool _isFirstRun = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isFirstRun = true;
    _secondsRemaining = 30;
    _isButtonEnabled = false;

    setState(() {});

    _timer = Timer(Duration.zero, () {
      _tick();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _tick();
      });
    });
  }

  void _tick() {
    if (!mounted) return;

    if (_isFirstRun) {
      _isFirstRun = false;
    } else {
      _secondsRemaining--;
    }

    if (_secondsRemaining <= 0) {
      setState(() {
        _isButtonEnabled = true;
      });
      _timer.cancel();
    } else {
      setState(() {});
    }
  }

  void _resendCode() {
    if (_isButtonEnabled) {
      _startTimer();
      widget.onResendPressed?.call();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isButtonEnabled ? _resendCode : null,
      child: Text(
        _isButtonEnabled ? 'Resend' : 'Send Code again 00:$_secondsRemaining',
        style: AppStyles.semibold16.copyWith(
          color: _isButtonEnabled ? AppColors.primaryColor : AppColors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
