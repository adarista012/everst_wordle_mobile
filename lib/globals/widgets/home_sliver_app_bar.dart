import 'package:flutter/material.dart';

class HeroAppBar extends StatelessWidget {
  const HeroAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      centerTitle: true,
      backgroundColor: Colors.red,
      title: Text(
        'Characters',
        style: TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.w900,
        ),
      ),
      expandedHeight: 20,
      collapsedHeight: 150,
    );
  }
}
