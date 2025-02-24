import 'package:bookly/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/manger/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController =
      ScrollController(); // إضافة ScrollController للتحكم في التمرير

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _controller.text.isNotEmpty) {
        _fetchSuggestions(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose(); // تفريغ ScrollController
    super.dispose();
  }

  void _fetchSuggestions(String pattern) async {
    final cubit = context.read<SearchCubit>();
    await cubit.searchBooks(pattern);
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      suggestionsCallback: (pattern) async {
        try {
          if (pattern.length < 1) return [];
          final cubit = context.read<SearchCubit>();
          await cubit.searchBooks(pattern);
          if (cubit.state is SearchSuccess) {
            return (cubit.state as SearchSuccess)
                .books
                .map((book) => book.volumeInfo.title ?? 'Unknown Title')
                .where((title) =>
                    title.toLowerCase().contains(pattern.toLowerCase()))
                .toList();
          }
          return [];
        } catch (e) {
          print('Error in suggestionsCallback: $e');
          return [];
        }
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      onSelected: (suggestion) {
        _controller.text = suggestion;
        context.read<SearchCubit>().searchBooks(suggestion);
      },
      debounceDuration: const Duration(milliseconds: 300),
      hideOnEmpty: false,
      animationDuration: const Duration(milliseconds: 200),
      decorationBuilder: (context, child) {
        return Transform.translate(
          offset: const Offset(0, -50), // سحب القائمة للأعلى بـ 50 بكسل
          child: Container(
            constraints: const BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Scrollbar(
              // إضافة شريط تمرير مرئي
              controller: _scrollController,
              child: SingleChildScrollView(
                controller:
                    _scrollController, // ربط ScrollController مع SingleChildScrollView
                child: child,
              ),
            ),
          ),
        );
      },
      scrollController:
          _scrollController, // ربط ScrollController مع TypeAheadField
      builder: (context, controller, focusNode) {
        return TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            hintText: "Search",
            suffixIcon: IconButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  final query = _controller.text;
                  context
                      .read<SearchCubit>()
                      .searchBooks(query)
                      .catchError((e) {
                    print('Error in search: $e');
                  });
                }
              },
              icon: const Opacity(
                opacity: 0.8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 22,
                ),
              ),
            ),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              _fetchSuggestions(value);
            }
          },
        );
      },
    );
  }
}
