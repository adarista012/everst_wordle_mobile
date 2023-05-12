import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ArViewController extends GetxController {
  late Uint8List bytes;
  bool isLoading = false;
  ArViewController() {
    _init();
  }
  void _init() {
    initArImage();
  }

  void initArImage() async {
    isLoading = true;
    var card = Get.arguments;
    var url = card!.thumbnailUrl!;
    bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    isLoading = false;
    update();
  }
}
