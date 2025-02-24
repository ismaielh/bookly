import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
    required this.backgroundColor, // لون خلفية الزر
    required this.textColor, // لون نص الزر
    this.borderRadius, // زوايا التدوير (اختياري)
    required this.text, // النص المعروض على الزر
    this.fontSize, // حجم الخط (اختياري)
     this.onPressed,
  });
void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48, // ارتفاع ثابت للزر
      child: TextButton(
        onPressed:onPressed, // وظيفة الزر (يمكن إضافتها لاحقًا)
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor, // لون الخلفية
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(
                    12), // زوايا التدوير (افتراضي 12 إذا لم يتم تحديده)
          ),
        ),
        child: Text(
          text,
          style: Styles.textstyle18.copyWith(
            color: textColor, // لون النص
            fontWeight: FontWeight.w900, // سمك الخط
            fontSize: fontSize, // حجم الخط (إذا تم تحديده)
          ),
        ),
      ),
    );
  }
}
