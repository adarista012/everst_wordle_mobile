// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle_mobile/helpers/hero_details_options.dart';
import 'package:wordle_mobile/helpers/hero_details_options_to_string.dart';
import 'package:wordle_mobile/views/character_detail_view/detail_controller.dart';

class ButtonDetails extends StatelessWidget {
  final HeroDetailsOptions detail;
  const ButtonDetails({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final DeatilController controller = Get.put(DeatilController());
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 2,
      height: 40,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.red.shade900,
        height: 40,
        onPressed: () async {
          await controller.getData(detail);
          Get.bottomSheet(
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.only(
                top: 16,
                left: 8,
                right: 8,
              ),
              child: Column(
                children: [
                  Text(
                    heroDetailsOptionsToStrig(detail).capitalizeFirst!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    flex: 6,
                    child: ListView(
                      children: controller.getList(),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.red.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                24,
              ),
            ),
            elevation: 0,
          );
        },
        child: Text(
          heroDetailsOptionsToStrig(detail).capitalizeFirst!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
