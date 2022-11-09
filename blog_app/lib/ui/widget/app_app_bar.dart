import 'package:blog_app/core/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_text_view.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, required this.titile});
  final String titile;
  @override
  Size get preferredSize => const Size.fromHeight(65);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: kWhite,
        ),
        onPressed: (() => Navigator.popAndPushNamed(context, "/home")),
      ),
      centerTitle: true,
      title: appTextView(name: titile, isBold: true, size: 18,color: kWhite),
    );
  }
}
