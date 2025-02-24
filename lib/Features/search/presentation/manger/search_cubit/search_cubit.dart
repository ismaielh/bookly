import 'package:bloc/bloc.dart';

import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/Features/search/presentation/manger/search_cubit/search_state.dart';


class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;

  SearchCubit(this.homeRepo) : super(SearchInitial());

  Future<void> searchBooks(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial()); // إعادة تعيين الحالة إذا كان النص فارغًا
      return;
    }
    emit(SearchLoading());
    try {
      var result = await homeRepo.fetchSearchBooks(query);
      result.fold(
        (failure) {
          emit(SearchFailure(failure.errMessage));
        },
        (books) {
          emit(SearchSuccess(books.where((book) => (book.volumeInfo.title?.toLowerCase() ?? '').contains(query.toLowerCase())).toList()));
        },
      );
    } catch (e) {
      emit(SearchFailure('Unexpected error: $e'));
    }
  }
}