import 'package:flutter/cupertino.dart';

class Food {
  final int id;
  final String nome;
  final String capa;
  final String ingredientes;
  final int restauranteId;
  final String restauranteNome;
  final String restauranteEndereco;

  Food({@required this.id, @required this.nome, @required this.ingredientes, @required this.restauranteId, @required this.restauranteNome, @required this.restauranteEndereco, @required this.capa});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        id: json['id'], nome: json['nome'], ingredientes: json['ingredientes'], restauranteId: json['restauranteId'], restauranteNome: json['restauranteNome'], restauranteEndereco: json['restauranteEndereco'], capa: json['capa'],);
  }
}
