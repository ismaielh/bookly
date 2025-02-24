import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';

import 'package:bookly/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_book_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilardBooks(
      category: widget.bookModel.volumeInfo.categories?.isNotEmpty == true
          ? widget.bookModel.volumeInfo.categories![0] ?? 'Programming'
          : 'Programming',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody:
                  false, // لتجنب التمرير غير الضروري إذا لم يكن هناك محتوى طويل
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(), // لتحسين تجربة التمرير
                child: Column(
                  children: [
                    CustomBookDaeilsAppBar(),
                    BookDetailsSection(book: widget.bookModel),
                    const SizedBox(height: 40),
                    const SimilarBooksSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
