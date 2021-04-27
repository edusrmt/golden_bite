import 'package:flutter/cupertino.dart';

class Rating {
  final int id;
  final String codigo;
  final String comentario;
  final double nota;
  final int clienteId;
  final String restauranteNome;
  final String festivalNome;
  final String pratoNome;

  Rating(
      {@required this.id,
      @required this.restauranteNome,
      @required this.festivalNome,
      @required this.pratoNome,
      @required this.comentario,
      @required this.codigo,
      @required this.nota,
      @required this.clienteId});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      pratoNome: json['pratoNome'],
      codigo: json['codigo'],
      nota: json['nota'] is int
          ? json['nota'].toDouble()
          : json['data'] as double,
      comentario: json['comentario'],
      restauranteNome: json['restauranteNome'],
      festivalNome: json['festivalNome'],
      clienteId: json['clienteId'],
    );
  }
}
