import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';

import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/core/utils/styles.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBarr(),
          FeaturedBooksListView(),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Best Seller",
            style: Styles.titelMedium,
          )
        ],
      ),
    );
  }
}
