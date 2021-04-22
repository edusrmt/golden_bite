import 'package:golden_bite/models/festival.dart';
import 'package:golden_bite/models/guide.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static String baseUrl = '192.168.0.106:3000';

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

  Future<List<Guide>> fetchGuides() async {
    final response = await http.get(Uri.http(baseUrl, 'guias'));

    if (response.statusCode == 200) {
      Iterable jsonBody = json.decode(response.body);
      List<Guide> guias =
          List<Guide>.from(jsonBody.map((e) => Guide.fromJson(e)));

      return guias;
    } else {
      throw Exception('Failed to retrive guide information');
    }
  }
}
