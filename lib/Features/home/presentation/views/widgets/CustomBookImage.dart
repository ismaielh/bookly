import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

// تعريف ويدجيت CustomListViewItem من نوع StatelessWidget
class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام SizedBox لتحديد ارتفاع العنصر بالنسبة لحجم الشاشة
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // استخدام اللون الأحمر كخلفية احتياطية

          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.testImage),
          ),
        ),
      ),
    );
  }
}
