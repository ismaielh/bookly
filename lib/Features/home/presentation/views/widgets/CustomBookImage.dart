
import 'package:flutter/material.dart';

// تعريف ويدجيت CustomListViewItem من نوع StatelessWidget
class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    // استخدام SizedBox لتحديد ارتفاع العنصر بالنسبة لحجم الشاشة
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // استخدام اللون الأحمر كخلفية احتياطية

          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
