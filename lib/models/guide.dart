import 'package:flutter/cupertino.dart';

class Guide {
  final int id;
  final String nome;
  final String descricao;
  final List pratos;

  Guide({@required this.id, @required this.nome, @required this.descricao, @required this.pratos});

  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
        id: json['id'], nome: json['nome'], descricao: json['descricao'], pratos: json['pratos']);
  }
}
