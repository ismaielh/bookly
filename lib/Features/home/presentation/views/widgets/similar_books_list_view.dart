import 'package:bookly/Features/home/presentation/views/widgets/CustomBookImage.dart';
import 'package:flutter/material.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
        // تعيين الاتجاه الأفقي للتمرير
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // إضافة const إلى Padding لتحسين الأداء
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(),
          );
        },
      ),
    );
  }
}
