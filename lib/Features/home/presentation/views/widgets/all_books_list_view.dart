
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class All_books_List_view extends StatelessWidget {
  const All_books_List_view({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kAllBooksView);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          "Show All Books",
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
