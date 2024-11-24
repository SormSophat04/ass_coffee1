import 'package:flutter/material.dart';

class AppColors {
  static const Color linghtMilk = Color(0xFFEBE6E0);
  static const Color primary = Color(0xFF4C7766);
  static const Color dark = Color(0xFF070707);
}

// ignore: non_constant_identifier_names
Text AppText(
  String text, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) =>
    Text(
      text,
      style: TextStyle(
        fontFamily: "pp",
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColors.dark,
      ),
      textDirection: TextDirection.rtl,
    );