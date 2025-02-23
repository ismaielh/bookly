import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errmessage});
  final String errmessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errmessage,
        style: Styles.textstyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
