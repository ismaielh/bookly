import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks({bool forceRefresh = false});
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks({bool forceRefresh = false});
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category, bool forceRefresh = false});
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(String query, {bool forceRefresh = false});
}