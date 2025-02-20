import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';

// تعريف ويدجيت CustomAppBarr من نوع StatelessWidget
class CustomAppBarr extends StatelessWidget {
  const CustomAppBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // إضافة الهوامش الأفقية والرأسية لتحديد مساحة Padding
      padding: const EdgeInsets.only(top: 5, bottom: 20, right: 20, left: 30),
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
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              ))
        ],
      ),
    );
  }
}
