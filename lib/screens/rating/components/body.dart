import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/components/rounded_button.dart';
import 'package:golden_bite/components/rounded_input_field.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:golden_bite/constants.dart';
import 'package:golden_bite/screens/myRatings/myRatings.dart';


class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
              onChanged: (value) {},
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
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            RoundedInputField(
              hintText: "Observação",
              size: 110,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "AVALIAR",
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyRatings())),
            ),
          ],
        ),
      ),
    );
  }
}
