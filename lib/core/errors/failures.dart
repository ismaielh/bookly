import 'package:dio/dio.dart';

// تعريف فئة Failure الأساسية لتمثيل الأخطاء
abstract class Failure {
  final String errMessage; // رسالة الخطأ

  Failure(this.errMessage); // Constructor يأخذ رسالة الخطأ
}

// فئة ServerFailure التي تمثل أخطاء الخادم وتورث من Failure
class ServerFailure extends Failure {
  ServerFailure(super.errMessage); // Constructor يأخذ رسالة الخطأ

  // Factory constructor لتحويل DioException إلى ServerFailure
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      // حالة انتهاء وقت الاتصال
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");

      // حالة انتهاء وقت الإرسال
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");

      // حالة انتهاء وقت الاستقبال
      case DioExceptionType.receiveTimeout: // تم تصحيح الخطأ الإملائي هنا
        return ServerFailure("Receive timeout with ApiServer");

      // حالة وجود شهادة SSL غير صالحة
      case DioExceptionType.badCertificate:
        return ServerFailure(
            "Bad certificate, please check your connection settings.");

      // حالة استجابة غير صالحة من الخادم
      case DioExceptionType.badResponse:
        if (dioError.response != null) {
          // إذا كانت الاستجابة موجودة، نتعامل معها بناءً على statusCode
          return ServerFailure.fromResponse(
              dioError.response!.statusCode, dioError.response!.data);
        } else {
          // إذا كانت الاستجابة غير موجودة، نرجع رسالة خطأ عامة
          return ServerFailure("Received invalid response from the server.");
        }

      // حالة إلغاء الطلب
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was canceled");

      // حالة وجود خطأ في الاتصال
      case DioExceptionType.connectionError:
        return ServerFailure(
            "Connection error, please check your internet connection.");

      // حالة خطأ غير معروف
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          // تم تصحيح الخطأ الإملائي هنا
          return ServerFailure("No Internet connection");
        } else {
          return ServerFailure("An unknown error occurred, please try again.");
        }

      // حالة افتراضية لأي نوع آخر من الأخطاء
      default:
        return ServerFailure("An unexpected error occurred, please try again.");
    }
  }

  // Factory constructor لإنشاء ServerFailure بناءً على statusCode و response
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    // حالة الأخطاء الشائعة (400, 401, 403)
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    }
    // حالة عدم العثور على الطلب (404)
    else if (statusCode == 404) {
      return ServerFailure("Your request was not found, please try later.");
    }
    // حالة خطأ في الخادم الداخلي (500)
    else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, please try later.");
    }
    // حالة أي خطأ آخر غير معروف
    else {
      return ServerFailure('Oops, there was an error, please try again.');
    }
  }
}
