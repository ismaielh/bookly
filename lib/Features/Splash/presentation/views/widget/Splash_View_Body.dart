import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          _navigateToHome();
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // عرض الأنيميشن باستخدام Lottie
            Positioned(
              top: size.height * 0.17, // إنزال الأنيميشن قليلاً للأسفل
              child: Lottie.asset(
                AssetsData.logo,
                width: size.width * 0.8,
                height: size.height * 0.8,
                fit: BoxFit.contain,
                repeat: false,
                animate: true,
                controller: _animationController,
              ),
            ),
            // عرض الصورة أعلى الأنيميشن مع فصلها قليلاً
            Positioned(
              bottom: size.height * 0.59, // إنزال الصورة قليلاً للأسفل
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 19.0), // إضافة تباعد بين الصورة والأنيميشن
                child: Image.asset(
                  AssetsData.logoimage,
                  width: size.width * 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHome() {
    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
  }
}
