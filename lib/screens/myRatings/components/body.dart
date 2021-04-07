import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/screens/myRatings/components/rating_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Melhor Pizza')), drawer: MainDrawer(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
            IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              alignment: Alignment.centerLeft,
            ),
          RatingCard(
            headerText: 'Braz Elettrica',
            nameFestival: 'Melhor pizza',
            rating: 3.5,
            supportingText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
          SizedBox(height: 15),
          RatingCard(
              headerText: 'Reis Magos',
              nameFestival: 'Melhor pizza',
              rating: 4.5,
              supportingText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
        ],
      ),
    );
  }
}