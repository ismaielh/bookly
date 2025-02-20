import 'package:bookly/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false, // يمنع التمرير داخل SliverFillRemaining
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30), // Padding أفقي
            child: Column(
              children: [
                // شريط التطبيق المخصص لتفاصيل الكتاب
                CustomBookDaeilsAppBar(),

                // قسم تفاصيل الكتاب
                BookDetailsSection(),

                // مساحة فارغة قابلة للتوسيع
                Expanded(
                  child: SizedBox(
                    height: 50, // ارتفاع ثابت للمساحة الفارغة
                  ),
                ),

                // قسم الكتب المشابهة
                SimilarBooksSection(),

                // مساحة إضافية في الأسفل
                SizedBox(
                  height: 40, // ارتفاع ثابت للمساحة الإضافية
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
