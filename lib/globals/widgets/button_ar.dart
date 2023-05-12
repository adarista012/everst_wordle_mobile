import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle_mobile/models/hero_card.dart';

class ButtonAr extends StatelessWidget {
  final HeroCard? card;
  const ButtonAr({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade900,
          borderRadius: BorderRadius.circular(100.0),
        ),
        height: 45,
        width: 45,
        child: IconButton(
          onPressed: () {
            Get.toNamed('/ar', arguments: card);
          },
          icon: const Icon(
            Icons.view_in_ar,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
