import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle_mobile/helpers/hero_details_options.dart';
import 'package:wordle_mobile/models/hero_card.dart';
import 'package:wordle_mobile/models/hero_details.dart';
import 'package:wordle_mobile/view_models/hero_detail_model.dart';

class DeatilController extends GetxController {
  HeroCard? args;
  HeroDetailsModel request = Get.put(HeroDetailsModel());
  List<HeroDetails> list = [];

  DeatilController() {
    _init();
  }
  void _init() {
    args = Get.arguments;
  }

  Future<void> getData(HeroDetailsOptions detailsOptions) async {
    list = [];
    await request.getDetails(args!.id!, detailsOptions);
    list.addAll(
      request.listOfDetails.map((element) => element),
    );
  }

  List<Widget> getList() {
    List<Widget> listW = [];
    int counter = 0;
    listW.addAll(
      list.map(
        (e) {
          counter++;
          return Text(
            e.title != null ? '$counter. ${e.title}' : 'Not found',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          );
        },
      ),
    );
    return listW;
  }
}
