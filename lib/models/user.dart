import 'package:flutter/cupertino.dart';

class User {
  final int id;
  final String nome;
  final String sobrenome;
  final String cpf;
  final String email;
  final String senha;

  User(
      {@required this.id,
      @required this.nome,
      @required this.sobrenome,
      @required this.cpf,
      @required this.email,
      this.senha});

  factory User.empty() {
    return User(id: -1, nome: '', sobrenome: '', cpf: '', email: '', senha: '');
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        nome: json['nome'],
        sobrenome: json['sobrenome'],
        cpf: json['cpf'],
        email: json['email'],
        senha: json['senha']);
  }
}
