import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks(
      {bool forceRefresh = false}) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Psychology+Computers");
      List<BookModel> books = [];
      for (var item in data['items'] ?? []) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks(
      {bool forceRefresh = false}) async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?Filtering=free-ebooks&q=subject:programming");
      List<BookModel> books = [];
      for (var item in data['items'] ?? []) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category, bool forceRefresh = false}) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category");
      List<BookModel> books = [];
      for (var item in data['items'] ?? []) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(String query,
      {bool forceRefresh = false}) async {
    try {
      var data =
          await apiService.get(endPoint: "volumes?q=$query&filter=free-ebooks");
      List<BookModel> books = [];
      for (var item in data['items'] ?? []) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  @override
  Future<Either<Failure, ({List<BookModel> books, int totalItems})>>
      fetchAllBooks(
          {int itemsPerPage = 40,
          int page = 1,
          bool forceRefresh = false}) async {
    try {
      int startIndex = (page - 1) * itemsPerPage;
      int maxResults = itemsPerPage.clamp(0, 40);
      String query = "all";

      var data = await apiService.get(
        endPoint:
            "volumes?q=$query&filter=free-ebooks&maxResults=$maxResults&startIndex=$startIndex",
      );
      int totalItems = data['totalItems'] ?? 0;
      List<BookModel> books = [];
      for (var item in data['items'] ?? []) {
        books.add(BookModel.fromJson(item));
      }

      if (books.isEmpty) {
        print('No more books found at startIndex: $startIndex');
        return right((books: [], totalItems: totalItems));
      }

      return right((books: books, totalItems: totalItems));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e) ??
          ServerFailure('An error occurred while fetching books'));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
