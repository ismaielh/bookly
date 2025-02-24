import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchSuccess extends SearchState {
  final List<BookModel> books;

  SearchSuccess(this.books);

  @override
  List<Object> get props => [books];
}

class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}