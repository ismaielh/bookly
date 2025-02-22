part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBookFailure extends FeaturedBooksState {
  final String errMessage;
  const FeaturedBookFailure(this.errMessage);
}

final class FeaturedBookSuccess extends FeaturedBooksState {
  final List<BookModel> books;

 const FeaturedBookSuccess(this.books);
}
