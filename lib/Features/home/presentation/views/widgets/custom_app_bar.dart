import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// تعريف ويدجيت CustomAppBarr من نوع StatelessWidget
class CustomAppBarr extends StatelessWidget {
  const CustomAppBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // إضافة الهوامش الأفقية والرأسية لتحديد مساحة Padding
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          // إضافة صورة كجزء من الشريط العلوي
          Image.asset(
            AssetsData.logoimage,
            height: 22,
          ),
          // Spacer لإضافة مساحة بين الصورة والزر
          const Spacer(),
          // زر أيقونة مع إجراء فارغ عند الضغط عليه
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
