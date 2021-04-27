import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/components/rounded_button.dart';
import 'package:golden_bite/components/rounded_input_field.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:golden_bite/constants.dart';
import 'package:golden_bite/screens/myRatings/myRatings.dart';
import 'package:golden_bite/services/api.dart';

class Body extends StatefulWidget {
  const Body(this.nomePrato, this.nomeRestaurante, this.nomeFestival);

  final String nomePrato;
  final String nomeRestaurante;
  final String nomeFestival;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  API _api;
  String code = "";
  double rating = 0.0;
  String comment = "";

  @override
  void initState() {
    super.initState();
    _api = new API();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Avaliação')),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RoundedInputField(
              hintText: "Código",
              onChanged: (value) {
                setState(() {
                  code = value;
                });
              },
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 30,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: kPrimaryColor,
              ),
              onRatingUpdate: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "Observação",
              size: 110,
              onChanged: (value) {
                setState(() {
                  comment = value;
                });
              },
            ),
            RoundedButton(
              text: "AVALIAR",
              press: () {
                _api
                    .createRating(widget.nomePrato, code, rating, comment,
                        widget.nomeRestaurante, widget.nomeFestival)
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyRatings()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
