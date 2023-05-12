import 'package:get/get_connect/connect.dart';
import 'package:wordle_mobile/helpers/hero_details_options.dart';
import 'package:wordle_mobile/helpers/hero_details_options_to_string.dart';
import 'package:wordle_mobile/helpers/md5_encoder.dart';
import 'package:wordle_mobile/utils/app_constants.dart';

class Requests extends GetConnect {
  final String _dateTime = '${DateTime.now().millisecondsSinceEpoch}';

  Future<Response> getList() async {
    String hash = Md5Encoder().encoder(_dateTime);
    Response response = await get(
      AppConstants.url,
      query: query(hash, _dateTime),
    );
    return response;
  }

  Future<Response> getHeroDetails(int id, HeroDetailsOptions detail) async {
    String hash = Md5Encoder().encoder(_dateTime);
    String typeDetail = heroDetailsOptionsToStrig(detail);
    Response response = await get(
      '${AppConstants.url}/$id/$typeDetail',
      query: query(hash, _dateTime),
    );
    return response;
  }
}

Map<String, dynamic>? query(String hash, dateTime) {
  return {'apikey': AppConstants.apiKeyPublic, 'hash': hash, 'ts': dateTime};
}
