import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:wordle_mobile/utils/app_constants.dart';

class Md5Encoder {
  String encoder(String dateTime) {
    String code =
        dateTime + AppConstants.apiKeyPrivate + AppConstants.apiKeyPublic;
    var utf = utf8.encode(code);
    String hash = md5.convert(utf).toString();

    return hash;
  }
}
