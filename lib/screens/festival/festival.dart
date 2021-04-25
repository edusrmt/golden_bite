import 'package:flutter/material.dart';
import 'package:golden_bite/screens/festival/components/body.dart';

class FestivalDetail extends StatefulWidget {
  final String titlePage;
  final List pratos;

  const FestivalDetail(this.pratos, this.titlePage);

  @override
  State<StatefulWidget> createState() {
    return _FestivalDetailState();
  }
}

class _FestivalDetailState extends State<FestivalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(widget.pratos, widget.titlePage),
    );
  }
}