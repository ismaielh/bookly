import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero, // إزالة الهوامش الداخلية للقائمة
      itemCount: 10, // عدد العناصر في القائمة
      itemBuilder: (context, index) {
        return const Padding(
          padding:
              EdgeInsets.symmetric(vertical: 10), // هوامش رأسية بين العناصر
          child: BookListViewItem(), // عرض عنصر الكتاب
        );
      },
    );
  }
}
