import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  // Constructor يأخذ ApiService كتبعية (dependency)
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      // جلب البيانات من API باستخدام ApiService
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer science");

      // تحويل البيانات إلى قائمة من BookModel
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      // إرجاع القائمة كنجاح (Right)
      return right(books);
    } on DioException catch (e) {
      // في حالة حدوث خطأ من نوع DioException، نتعامل معه باستخدام ServerFailure
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      // في حالة حدوث أي خطأ آخر، نرجعه كـ ServerFailure
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      // جلب البيانات من API باستخدام ApiService
      var data = await apiService.get(
          endPoint: "volumes?Filtering=free-ebooks&q=subject:programming");

      // تحويل البيانات إلى قائمة من BookModel
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      // إرجاع القائمة كنجاح (Right)
      return right(books);
    } on DioException catch (e) {
      // في حالة حدوث خطأ من نوع DioException، نتعامل معه باستخدام ServerFailure
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      // في حالة حدوث أي خطأ آخر، نرجعه كـ ServerFailure
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      // جلب البيانات من API باستخدام ApiService
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category");

      // تحويل البيانات إلى قائمة من BookModel
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      // إرجاع القائمة كنجاح (Right)
      return right(books);
    } on DioException catch (e) {
      // في حالة حدوث خطأ من نوع DioException، نتعامل معه باستخدام ServerFailure
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      // في حالة حدوث أي خطأ آخر، نرجعه كـ ServerFailure
      return left(ServerFailure(e.toString()));
    }
  }
}
