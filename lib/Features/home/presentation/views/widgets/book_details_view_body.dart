import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/CustomBookImage.dart';
import 'package:bookly/core/utils/styles.dart';

import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomBookDaeilsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .19),
            child: CustomBookImage(),
          ),
          const SizedBox(
            height: 43,
          ),
          Text(
            "The Jungle Book",
            style: Styles.textstyle30.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
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
            height: 18,
          ),
          BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
