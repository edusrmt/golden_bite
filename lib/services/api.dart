import 'package:golden_bite/models/festival.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static String baseUrl = '10.0.0.20:3000';

  Future<List<Festival>> fetchFestivals() async {
    final response = await http.get(Uri.http(baseUrl, 'festivais',
        {'data_fim_gte': DateFormat("yyyy-MM-dd").format(DateTime.now())}));

    if (response.statusCode == 200) {
      Iterable jsonBody = json.decode(response.body);
      List<Festival> festivals =
          List<Festival>.from(jsonBody.map((e) => Festival.fromJson(e)));

      return festivals;
    } else {
      throw Exception('Failed to retrive festivals information');
    }
  }
}
