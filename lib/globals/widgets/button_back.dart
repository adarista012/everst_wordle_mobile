import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade900,
        borderRadius: BorderRadius.circular(100.0),
      ),
      height: 45,
      width: 45,
      child: BackButton(
        onPressed: () {
          Get.back();
        },
        color: Colors.white,
      ),
    );
  }
}
