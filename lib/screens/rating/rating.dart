import 'package:flutter/material.dart';
import 'package:golden_bite/screens/rating/components/body.dart';

class Rating extends StatefulWidget {
  final String nomePrato;
  final String nomeRestaurante;
  final String nomeFestival;

  const Rating(this.nomePrato, this.nomeRestaurante, this.nomeFestival);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
            widget.nomePrato, widget.nomeRestaurante, widget.nomeFestival));
  }
}
