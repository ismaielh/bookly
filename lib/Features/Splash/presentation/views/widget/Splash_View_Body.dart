import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late VideoPlayerController _videoController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();

    // تهيئة متحكم الفيديو مع مسار الفيديو
    _videoController = VideoPlayerController.asset(
      AssetsData.videoPath, // استبدل هذا بمسار الفيديو في AssetsData
    )..initialize().then((_) {
        // بدء التشغيل عند اكتمال التهيئة
        setState(() {
          _isVideoInitialized = true;
        });
        _videoController.play();

        // الانتقال إلى الصفحة التالية بعد انتهاء الفيديو
        _videoController.addListener(() {
          if (!_videoController.value.isPlaying &&
              _videoController.value.position >=
                  _videoController.value.duration) {
            _navigateToHome();
          }
        });
      });
  }

  @override
  void dispose() {
    _videoController.dispose(); // تحرير الموارد عند إغلاق الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // خلفية سوداء لتتناسب مع الفيديو
      body: Center(
        child: _isVideoInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : Container(), // لا يتم عرض أي شيء أثناء التهيئة
      ),
    );
  }

  void _navigateToHome() {
    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
  }
}
