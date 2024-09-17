import 'package:flutter/material.dart';

class ListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      foregroundColor: Colors.blueGrey,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text('Kraken Anime List'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
