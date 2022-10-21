import 'package:blog_app/core/app_colors.dart';
import 'package:flutter/material.dart';

Widget appTextView(
    {String name = "",
    double size = 15,
    int maxLines = 1,
    Color color = kBlack,
    bool isBold = false}) {
  return Text(
    name,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: size,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
        color: color),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
  );
}
