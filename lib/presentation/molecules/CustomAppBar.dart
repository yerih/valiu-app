
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final bool centerTitle;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.centerTitle = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      centerTitle: centerTitle,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white,),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}