import 'package:bookly/Features/home/presentation/manger/feature_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/CustomBookImage.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loaading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  // يجب إضافة const عند تعريف المتغيرات الثابتة لضمان تحسين الأداء
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery لضبط الارتفاع حسب حجم الشاشة
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBookSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                // تعيين الاتجاه الأفقي للتمرير
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // إضافة const إلى Padding لتحسين الأداء
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(),
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
      ),
    );
  }
}
