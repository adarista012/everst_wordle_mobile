import 'package:get/get.dart';
import 'package:wordle_mobile/helpers/hero_details_options.dart';
import '../models/hero_details.dart';
import '../services/requests.dart';

class HeroDetailsModel {
  final Requests request = Get.put(Requests());
  List<HeroDetails> listOfDetails = [];
  Future<void> getDetails(
    int id,
    HeroDetailsOptions detail,
  ) async {
    Response response;
    response = await request.getHeroDetails(id, detail);
    if (response.statusCode == 200) {
      if (response.body != null) {
        dynamic data = response.body['data'];
        if (data != null) {
          List<dynamic> list = data['results'];
          listOfDetails = [];
          listOfDetails.addAll(
            list.map(
              (e) => HeroDetails.fromJson(e),
            ),
          );
        }
      } else {}
    }
    if (response.statusCode == 404) {
      // print('404');
    }
    if (response.statusCode == 401) {
      // print('401');
    }
  }
}
