import 'package:bookly/Features/home/presentation/views/widgets/all_books_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController =
      ScrollController(); // إضافة ScrollController للتحكم في التمرير

  @override
  void initState() {
    super.initState();
    // يمكنك إضافة تهيئة هنا إذا كنت بحاجة إلى جلب بيانات أو تهيئة Cubit
  }

  @override
  void dispose() {
    _scrollController.dispose(); // تفريغ ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController, // ربط ScrollController مع CustomScrollView
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Newest Books",
                  style: Styles.textstyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BestSellerListView(),
                const SizedBox(height: 20),
                All_books_List_view(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
