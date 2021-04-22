import 'package:flutter/cupertino.dart';

class Festival {
  final int id;
  final String nome;
  final String capa;
  final String descricao;
  final DateTime dataFim;

  Festival(
      {@required this.id,
      @required this.nome,
      @required this.capa,
      @required this.descricao,
      @required this.dataFim});

  factory Festival.fromJson(Map<String, dynamic> json) {
    return Festival(
        id: json['id'],
        nome: json['nome'],
        capa: json['capa'],
        descricao: json['descricao'],
        dataFim: DateTime.parse(json['data_fim']));
  }

  String tempoRestante() {
    DateTime agora = DateTime.now();
    int tempoRestante = this.dataFim.difference(agora).inDays;

    if (tempoRestante == 0) {
      return "até hoje";
    } else if (tempoRestante == 1) {
      return "até amanhã";
    } else {
      return "restam $tempoRestante dias";
    }
  }
}
