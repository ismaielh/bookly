import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/CustomBookImage.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    // استخدم MediaQuery للحصول على عرض الشاشة
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .19), // استخدم النسبة لتعيين الحافة الأفقية
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? "",
          ), // CustomBookImage عنصر ثابت لا يتغير
        ),
        const SizedBox(
          height: 43, // استخدم const لتعيين الحجم الثابت
        ),
        Text(
          book.volumeInfo.title!,
          style: Styles.textstyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6, // استخدم const لتعيين الحجم الثابت
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ?? "",
            style: Styles.textstyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18, // استخدم const لتعيين الحجم الثابت
        ),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingCount ?? 0,
          mainAxisAlignment:
              MainAxisAlignment.center, // BooksRating عنصر ثابت لا يتغير
        ),
        const SizedBox(
          height: 37, // استخدم const لتعيين الحجم الثابت
        ),
        const BooksAction(), // BooksAction عنصر ثابت لا يتغير
      ],
    );
  }
}
