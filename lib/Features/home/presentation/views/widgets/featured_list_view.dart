import 'package:bookly/Features/home/presentation/manger/feature_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/CustomBookImage.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loaading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.books[index], // تمرير بيانات الكتاب هنا
                      );
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              "",
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrorWidget(errmessage: state.errMessage);
        } else {
          return const CustomLoaadingIndicator();
        }
      },
    );
  }
}
