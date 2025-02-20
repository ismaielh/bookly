import 'package:bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // تطبيق هوامش أفقية ثابتة
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
        children: const [
          // عرض حقل البحث المخصص
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          // نص لعرض عنوان "Search Result"
          Text(
            "Search Result",
            style: Styles
                .textstyle18, // استخدام النمط المحدد في Styles.textstyle18
          ),
          SizedBox(
            height: 16,
          ),
          // قائمة نتائج البحث
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
