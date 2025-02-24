// دالة مخصصة لعرض AwesomeDialog
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void customAwesomeDialog(BuildContext context, String text) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType
        .error, // نوع الحوار (يمكنك تغييره إلى info, success, warning, إلخ)
    animType: AnimType.scale, // نوع الحركة (scale, bottomSlide, topSlide, إلخ)
    title: 'Error', // العنوان
    desc: text, // النص الذي سيظهر (مثل "Cannot launch URL")
    // زر الإلغاء (اختياري)
    btnOkOnPress: () {}, // زر الموافقة (اختياري)
    btnOkText: "OK", // نص زر الموافقة
    // نص زر الإلغاء
    // تخصيص الألوان والشكل
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
    ),
    descTextStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black87,
    ),
    dialogBackgroundColor: Colors.white, // لون خلفية الحوار
    borderSide: const BorderSide(
      color: Colors.redAccent, // لون الحدود
      width: 2,
    ),
    btnOkColor: Colors.redAccent, // لون زر الموافقة
    // لون زر الإلغاء
  ).show(); // عرض الحوار
}
