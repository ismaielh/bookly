import 'package:bookly/Features/home/presentation/views/widgets/All_books_view_body.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

/// A [StatefulWidget] that serves as a container for the All Books view with a custom app bar,
/// limited to 13 pages with 40 books per page.
class AllBooksView extends StatefulWidget {
  const AllBooksView({super.key});

  @override
  State<AllBooksView> createState() => _AllBooksViewState();
}

class _AllBooksViewState extends State<AllBooksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: const SafeArea(
          child: All_books_view_body()), // استدعاء البودي داخل SafeArea
    );
  }
}
