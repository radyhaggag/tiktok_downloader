import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../config/routes_manager.dart';
import '../../../../core/media_query.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: AppConstants.animationTime),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    Timer.periodic(
      const Duration(milliseconds: AppConstants.navigateTime),
      (timer) => navigateToNextScreen(),
    );
  }

  navigateToNextScreen() {
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.downloader,
        (route) => false,
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: context.width,
        height: context.height,
        padding: const EdgeInsets.all(AppSize.s20),
        decoration: BoxDecoration(gradient: AppColors.splashGradient),
        child: FadeTransition(
          opacity: _animation,
          child: const Image(
            width: AppSize.s100,
            height: AppSize.s100,
            fit: BoxFit.scaleDown,
            image: AssetImage(AppAssets.tiktokLogo),
          ),
        ),
      ),
    );
  }
}
