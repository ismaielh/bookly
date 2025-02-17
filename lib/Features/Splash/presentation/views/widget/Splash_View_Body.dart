import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Lottie.asset(
            AssetsData.logo,
            width: size.width * 0.8,
            height: size.height * 0.8,
            fit: BoxFit.contain,
            repeat: true,
            animate: true,
            controller: animationController,
            onLoaded: (composition) {
              animationController
                ..duration = composition.duration
                ..forward();
            },
          ),
        ],
      ),
    );
  }
  
  void navigateToHome() {
     Future.delayed(const Duration(seconds: 7), () {
      Get.to(() => const HomeView(),
          transition: Transition.fadeIn, duration: kTranstionDuration);
    });
  }

}
