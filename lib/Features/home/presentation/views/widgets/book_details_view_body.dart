import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false, // يمنع التمرير داخل SliverFillRemaining
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30), // Padding أفقي
            child: Column(
              children: [
                // شريط التطبيق المخصص لتفاصيل الكتاب
                const CustomBookDaeilsAppBar(),

                // قسم تفاصيل الكتاب
                BookDetailsSection(
                  book: bookModel,
                ),

                // مساحة فارغة قابلة للتوسيع
                const Expanded(
                  child: SizedBox(
                    height: 50, // ارتفاع ثابت للمساحة الفارغة
                  ),
                ),

                // قسم الكتب المشابهة
                const SimilarBooksSection(),

                // مساحة إضافية في الأسفل
                const SizedBox(
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
