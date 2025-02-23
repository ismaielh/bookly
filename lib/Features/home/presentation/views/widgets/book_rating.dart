import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        // أيقونة النجمة لتقييم الكتاب
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        // إضافة مسافة بين النجمة والنص
        const SizedBox(
          width: 6.3,
        ),
        // نص يعرض التقييم
        Text(
          rating.toString(),
          style: Styles.textstyle16,
        ),
        // إضافة مسافة بين التقييم وعدد المراجعات
        const SizedBox(
          width: 5,
        ),
        // نص يعرض عدد المراجعات
        Opacity(
          opacity: .5,
          child: Text(
            "($count)",
            style: Styles.textstyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
