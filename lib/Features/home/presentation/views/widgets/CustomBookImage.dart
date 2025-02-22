import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// تعريف ويدجيت CustomListViewItem من نوع StatelessWidget
class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    // استخدام SizedBox لتحديد ارتفاع العنصر بالنسبة لحجم الشاشة
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
