import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/Features/home/presentation/views/widgets/AllBooksListViewItem.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';


/// A [StatefulWidget] that manages and displays the paginated list of all books with a custom design,
/// limited to 13 pages with 40 books per page, without a traditional AppBar.
class All_books_view_body extends StatefulWidget {
  const All_books_view_body({super.key});

  @override
  State<All_books_view_body> createState() => _All_books_view_bodyState();
}

class _All_books_view_bodyState extends State<All_books_view_body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(), // Custom design element, not a traditional AppBar
          Expanded(child: AllBooksListView()),
        ],
      ),
    );
  }
}