import 'package:bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // تطبيق هوامش أفقية ثابتة
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: const [
          // عرض حقل البحث المخصص
          CustomSearchTextField(),
        ],
      ),
    );
  }
}
