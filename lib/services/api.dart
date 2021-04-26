import 'package:golden_bite/models/festival.dart';
import 'package:golden_bite/models/guide.dart';
import 'package:golden_bite/models/food.dart';
import 'package:golden_bite/models/user.dart';
import 'package:golden_bite/models/rating.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:crypt/crypt.dart';
import 'dart:convert';

class API {
  static String baseUrl = '192.168.15.170:3000';

  Future<bool> createAccount(String nome, String sobrenome, String cpf,
      String email, String senha) async {
    final sameEmail =
        await http.get(Uri.http(baseUrl, 'clientes', {'email': email}));

    if (sameEmail.statusCode == 200 && sameEmail.body == '[]') {
      final sameCPF =
          await http.get(Uri.http(baseUrl, 'clientes', {'cpf': cpf}));

      if (sameCPF.statusCode == 200 && sameCPF.body == '[]') {
        final hashSenha = Crypt.sha256(senha);

        final response = await http.post(
          Uri.http(baseUrl, 'clientes'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'nome': nome,
            'sobrenome': sobrenome,
            'cpf': cpf,
            'email': email,
            'senha': hashSenha.toString()
          }),
        );

        if (response.statusCode == 201) {
          return true;
        }
      }
    }

    return false;
  }

  Future<bool> editProfile(
      int id, String nome, String sobrenome, String cpf, String email) async {
    final response = await http.get(Uri.http(baseUrl, 'clientes/$id'));

    if (response.statusCode == 200) {
      Iterable jsonBody = json.decode(response.body);

      User user = User.fromJson(jsonBody.first);

      int id = user.id;
      String meuCPF = user.cpf;
      String meuEmail = user.email;

      final sameEmail =
          await http.get(Uri.http(baseUrl, 'clientes', {'email': email}));

      if (sameEmail.statusCode == 200 &&
          (sameEmail.body == '[]' || sameEmail.body == meuEmail)) {
        final sameCPF =
            await http.get(Uri.http(baseUrl, 'clientes', {'cpf': cpf}));

        if (sameCPF.statusCode == 200 &&
            (sameCPF.body == '[]' || sameCPF.body == meuCPF)) {
          final response = await http.put(
            Uri.http(baseUrl, 'clientes/$id'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'nome': nome,
              'sobrenome': sobrenome,
              'cpf': cpf,
              'email': email
            }),
          );

          if (response.statusCode == 204) {
            return true;
          }
        }
      }
    }
    return false;
  }

  Future<User> login(String email, String senha) async {
    final response =
        await http.get(Uri.http(baseUrl, 'clientes', {'email': email}));

    if (response.statusCode == 200) {
      Iterable jsonBody = json.decode(response.body);

      if (jsonBody.isNotEmpty) {
        final user = jsonBody.first;
        final hash = Crypt(user['senha']);

        if (hash.match(senha)) {
          return User.fromJson(user);
        }
      }
    }

    return User.empty();
  }

  Future<User> fetchUser(String email) async {
    final response =
        await http.get(Uri.http(baseUrl, 'clientes', {'email': email}));

    if (response.statusCode == 200) {
      Iterable jsonBody = json.decode(response.body);

      User user = User.fromJson(jsonBody.first);

      return user;
    } else {
      throw Exception('Failed to retrive user information');
    }
  }

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

  Future<List<Food>> fetchFood(List pratos) async {
    final response = await http.get(Uri.http(baseUrl, 'pratos'));

    if (response.statusCode == 200) {
      Iterable jsonBody = json.decode(response.body);
      List<Food> food = List<Food>.from(jsonBody.map((e) => Food.fromJson(e)));

      List<Food> foodsList = food.where((e) => pratos.contains(e.id)).toList();

      return foodsList;
    } else {
      throw Exception('Failed to retrive food information');
    }
  }

  Future<List<Rating>> fetchRating(int idUser) async {
    final response = await http.get(Uri.http(baseUrl, 'avaliacao'));

    if (response.statusCode == 200) {
      Iterable jsonBody = json.decode(response.body);
      List<Rating> rating =
          List<Rating>.from(jsonBody.map((e) => Rating.fromJson(e)));

      List<Rating> ratingList =
          rating.where((e) => e.clienteId == idUser).toList();

      return ratingList;
    } else {
      throw Exception('Failed to retrive rating information');
    }
  }
}
