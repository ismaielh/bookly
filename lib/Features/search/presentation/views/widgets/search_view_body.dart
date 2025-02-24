import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/manger/search_cubit/search_state.dart';
import 'package:bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late SearchCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = SearchCubit(getIt.get<HomeRepo>());
    _cubit.searchBooks(''); // البدء بحالة فارغة دون جلب بيانات
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocProvider.value(
            value: _cubit,
            child: const CustomSearchTextField(),
          ),
          const SizedBox(height: 16),
          const Text(
            "Search Result",
            style: Styles.textstyle18,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state is SearchSuccess) {
                  if (state.books.isEmpty) {
                    return const Center(child: Text("No results found"));
                  }
                  return SearchResultListView(books: state.books);
                } else if (state is SearchFailure) {
                  return CustomErrorWidget(errmessage: state.errMessage);
                } else {
                  return const Center(
                      child: Text(
                          "Enter a search query to see results")); // نص بدلاً من دائرة التحميل
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
