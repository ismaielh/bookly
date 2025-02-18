import 'package:bookly/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  // يجب إضافة const عند تعريف المتغيرات الثابتة لضمان تحسين الأداء
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery لضبط الارتفاع حسب حجم الشاشة
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        // تعيين الاتجاه الأفقي للتمرير
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // إضافة const إلى Padding لتحسين الأداء
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: FeaturedListViewItem(),
          );
        },
      ),
    );
  }
}
