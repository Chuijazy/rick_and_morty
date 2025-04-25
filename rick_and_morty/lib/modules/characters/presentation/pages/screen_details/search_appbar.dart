import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const SearchAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff0B1E2D),
      title: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: 'Search character...',
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
