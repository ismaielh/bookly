import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // أيقونة النجمة لتقييم الكتاب
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        // إضافة مسافة بين النجمة والنص
        const SizedBox(
          width: 6.3,
        ),
        // نص يعرض التقييم
        const Text(
          "4.8",
          style: Styles.textstyle16,
        ),
        // إضافة مسافة بين التقييم وعدد المراجعات
        const SizedBox(
          width: 5,
        ),
        // نص يعرض عدد المراجعات
        Text(
          "(254)",
          style: Styles.textstyle14.copyWith(color: const Color(0xff707070)),
        )
      ],
    );
  }
}
