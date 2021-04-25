import 'package:flutter/material.dart';
import 'package:golden_bite/screens/guide/components/body.dart';

class GuideDetail extends StatefulWidget {
  final String titlePage;
  final List pratos;

  const GuideDetail(this.pratos, this.titlePage);

  @override
  State<StatefulWidget> createState() {
    return _GuideDetailState();
  }
}

class _GuideDetailState extends State<GuideDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(widget.pratos, widget.titlePage),
    );
  }
}
