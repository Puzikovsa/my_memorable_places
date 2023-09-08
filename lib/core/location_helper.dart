import 'dart:convert';

import 'package:http/http.dart' as http;

const GEOCOD_API = '0c33f019-1fce-498d-bcb5-3c06a48fd5cb';

class LocationHelper {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://static-maps.yandex.ru/1.x/?ll=$longitude,$latitude&size=450,450&z=14&l=map&pt=$longitude,$latitude,comma';
  }

  static Future<String> getAdressFromLocation({
  required double latitude,
  required double longitude,
}) async {
    String requestUrl = 'https://geocode.maps-yandex.ru/1.x/?format=json&apikey=$GEOCOD_API&geocode=$longitude,$latitude';
    var response = await http.get(Uri.parse(requestUrl));

    String? result = jsonDecode(response.body)['response']
    ['GeoObjectCollection']['featureMember'][0]['GeoObject']
    ['metaDataProperty']['GeocoderMetaData']['text'];

    return result ?? '';

  }
}
