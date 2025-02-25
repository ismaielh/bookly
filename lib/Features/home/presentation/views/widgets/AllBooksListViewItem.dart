import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A [StatefulWidget] that displays a paginated list of all books from the Google Books API,
/// limited to 13 pages with 40 books per page, with pull-to-refresh support.
class AllBooksListView extends StatefulWidget {
  const AllBooksListView({super.key});

  @override
  State<AllBooksListView> createState() => _AllBooksListViewState();
}

class _AllBooksListViewState extends State<AllBooksListView> {
  late final HomeRepo _homeRepo;
  final List<BookModel> _books = []; // List to store fetched books
  final int _itemsPerPage =
      40; // Maximum books per page as per Google Books API
  final int _maxPages = 13; // Maximum pages (1-13) as specified
  int _currentPage = 1; // Current page number
  int _totalItems = 520; // Total items (13 pages * 40 books per page)
  bool _isLoading = false; // Loading state for fetching books
  final ScrollController _scrollController =
      ScrollController(); // For scrolling control

  @override
  void initState() {
    super.initState();
    _homeRepo = getIt.get<HomeRepo>();
    _fetchBooks(); // Fetch the first page on initialization
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up ScrollController
    super.dispose();
  }

  /// Fetches books for the current page from the HomeRepo.
  Future<void> _fetchBooks() async {
    if (_isLoading) return; // Prevent multiple simultaneous fetch requests

    setState(() => _isLoading = true);

    final result = await _homeRepo.fetchAllBooks(
      itemsPerPage: _itemsPerPage,
      page: _currentPage,
    );

    result.fold(
      (failure) => _showError(failure.errMessage ?? 'Failed to fetch books'),
      (value) {
        if (mounted) {
          setState(() {
            _books.clear(); // Clear previous books
            _books.addAll(value.books); // Add new books
            _isLoading = false;
            // Keep totalItems fixed at 520 unless otherwise specified
          });

          // Scroll to top after fetching new books
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }

          // Automatically go back to the previous page if the current page is empty and not the first page
          if (_books.isEmpty && _currentPage > 1) {
            _goToPage(_currentPage - 1);
          }
        }
      },
    );
  }

  /// Navigates to the specified page, ensuring it’s within the valid range (1-13).
  void _goToPage(int page) {
    if (page < 1 || page > _maxPages || _isLoading) return;

    setState(() {
      _currentPage = page;
    });
    _fetchBooks();
  }

  /// Builds the pagination controls, including arrows and page numbers, for pages 1-13.
  Widget _buildPaginationControls() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
            onPressed:
                _currentPage > 1 ? () => _goToPage(_currentPage - 1) : null,
            tooltip: "Previous page",
          ),
          _buildPageNumbers(),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
            onPressed: _currentPage < _maxPages && !_isLoading
                ? () => _goToPage(_currentPage + 1)
                : null,
            tooltip: "Next page",
          ),
        ],
      ),
    );
  }

  /// Builds the page numbers, showing only pages 1-13.
  Widget _buildPageNumbers() {
    const int visiblePages = 7; // Number of visible page numbers
    final List<Widget> pageNumbers = [];
    final int startPage = (_currentPage - (visiblePages ~/ 2))
        .clamp(1, _maxPages - visiblePages + 1);
    final int endPage = (startPage + visiblePages - 1).clamp(1, _maxPages);

    for (int i = startPage; i <= endPage; i++) {
      pageNumbers.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () => _goToPage(i),
            child: Text(
              i.toString(),
              style: TextStyle(
                color: _currentPage == i ? Colors.blue : Colors.white,
                fontWeight:
                    _currentPage == i ? FontWeight.bold : FontWeight.normal,
                fontSize: 16, // Consistent font size for readability
              ),
            ),
          ),
        ),
      );
    }

    return Row(children: pageNumbers);
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchBooks, // Trigger refresh when pulled down
      color: Colors.blue, // Color of the refresh indicator
      child: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.blue))
          : _books.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "No books found on this page",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.blue),
                        onPressed: _currentPage > 1
                            ? () => GoRouter.of(context).pop()
                            : null,
                        tooltip: "Back to previous page",
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 16),
                        itemCount: _books.length,
                        itemExtent:
                            160, // Increased height to accommodate longer text
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BookListViewItem(bookModel: _books[index]),
                          );
                        },
                      ),
                    ),
                    _buildPaginationControls(), // Use the combined pagination with arrows
                  ],
                ),
    );
  }
}
