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
}
