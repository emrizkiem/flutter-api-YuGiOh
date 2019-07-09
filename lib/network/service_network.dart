import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:osg4_project_final/model/card_info.dart';

class ServiceNetwork {
  Future<List<CardInfo>> loadData() async {
    http.Response response =
        await http.get("https://db.ygoprodeck.com/api/v5/cardinfo.php?num=10");
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return (jsonResponse as List)
          .map((data) => CardInfo.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed load data');
    }
  }
}
