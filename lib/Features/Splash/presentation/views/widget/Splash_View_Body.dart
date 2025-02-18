import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// تعريف ويدجيت من نوع StatefulWidget يمثل شاشة البداية
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // تعريف متغير للتحكم بالأنيميشن
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // تهيئة متحكم الأنيميشن مع مدة زمنية محددة
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // تعديل المدة إلى 5 ثواني
    )..forward();

    // استدعاء الدالة التي تنقل إلى الشاشة الرئيسية بعد انتهاء الأنيميشن
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
    // التخلص من متحكم الأنيميشن عند التخلص من ويدجيت
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // بناء واجهة المستخدم
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // عرض الأنيميشن باستخدام Lottie
          Lottie.asset(
            AssetsData.logo,
            width: size.width * 0.8,
            height: size.height * 0.8,
            fit: BoxFit.contain,
            repeat: false,
            animate: true,
            controller: _animationController,
          ),
        ],
      ),
    );
  }

  // دالة لنقل المستخدم إلى الشاشة الرئيسية بعد انتهاء الأنيميشن والانتظار لمدة ثانيتين
  void _navigateToHome() {
    Get.off(() => const HomeView(),
        transition: Transition.fadeIn, duration: kTranstionDuration);
  }
}
