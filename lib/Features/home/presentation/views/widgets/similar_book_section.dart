import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
      children: [
        // نص "You can also like"
        Text(
          "You can also like",
          style: Styles.textstyle14.copyWith(
            fontWeight: FontWeight.w600, // سمك الخط
          ),
        ),

        // مساحة فارغة بين النص والقائمة
        const SizedBox(
          height: 16,
        ),

        // قائمة الكتب المشابهة
        const SimilarBooksListview(),
      ],
    );
  }
}
