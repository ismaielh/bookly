import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBooksView extends StatefulWidget {
  const AllBooksView({super.key});

  @override
  State<AllBooksView> createState() => _AllBooksViewState();
}

class _AllBooksViewState extends State<AllBooksView> {
  late final HomeRepo homeRepo;

  @override
  void initState() {
    super.initState();
    homeRepo = getIt.get<HomeRepo>();
    _fetchAllBooks();
  }

  Future<void> _fetchAllBooks() async {
    final result = await homeRepo.fetchSearchBooks("all books"); // جلب جميع الكتب باستعلام عام
    result.fold(
      (failure) {
        // معالجة الفشل (يمكن عرض رسالة خطأ)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.errMessage)));
      },
      (books) {
        setState(() {
          _books = books; // تخزين الكتب في القائمة
        });
      },
    );
  }

  List<BookModel> _books = []; // قائمة لتخزين جميع الكتب

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Books"),
      ),
      body: _books.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              itemCount: _books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(bookModel: _books[index]),
                );
              },
            ),
    );
  }
}