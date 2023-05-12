import 'package:get/get.dart';
import '../models/hero_card.dart';
import '../services/requests.dart';

class ListOfCardsModel {
  List<HeroCard>? listOfCards = [];
  final Requests request = Get.put(Requests());

  Future<void> getListOfCards() async {
    Response response;
    response = await request.getList();

    if (response.statusCode == 200) {
      dynamic data = response.body['data'];
      if (data != null) {
        List<dynamic> list = data['results'];
        listOfCards?.addAll(list.map((e) => HeroCard.fromJson(e)));
      } else {}
    }
    if (response.statusCode == 401) {}
  }
}
