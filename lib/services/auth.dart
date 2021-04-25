import 'package:golden_bite/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static Future<Null> storeUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', user.id);
    prefs.setString('nome', user.nome);
    prefs.setString('sobrenome', user.sobrenome);
    prefs.setString('cpf', user.cpf);
    prefs.setString('email', user.email);
  }

  static Future<Null> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', -1);
    prefs.setString('nome', '');
    prefs.setString('sobrenome', '');
    prefs.setString('cpf', '');
    prefs.setString('email', '');
  }

  static Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return User(
        id: prefs.getInt('id') ?? -1,
        nome: prefs.getString('nome') ?? '',
        sobrenome: prefs.getString('sobrenome') ?? '',
        cpf: prefs.getString('cpf') ?? '',
        email: prefs.getString('email') ?? '');
  }
}
