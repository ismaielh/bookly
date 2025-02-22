import 'package:bookly/Features/home/presentation/views/widgets/CustomBookImage.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدم MediaQuery للحصول على عرض الشاشة
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .19), // استخدم النسبة لتعيين الحافة الأفقية
          child: const CustomBookImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf6zoRR_FPG7f2knECoYTgOuETejMYPg71vg&s",), // CustomBookImage عنصر ثابت لا يتغير
        ),
        const SizedBox(
          height: 43, // استخدم const لتعيين الحجم الثابت
        ),
        Text(
          "The Jungle Book",
          style: Styles.textstyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6, // استخدم const لتعيين الحجم الثابت
        ),
        Opacity(
          opacity: .7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textstyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18, // استخدم const لتعيين الحجم الثابت
        ),
        const BookRating(
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
