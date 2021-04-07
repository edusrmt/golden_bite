import 'package:flutter/material.dart';
import 'package:golden_bite/constants.dart';
import 'package:golden_bite/screens/rating/rating.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    Key key,
    this.headerText,
    this.rating,
    this.nameFestival,
    this.supportingText,
  }) : super(key: key);

  final String headerText;
  final String nameFestival;
  final double rating;
  final String supportingText;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(headerText, style: Theme.of(context).textTheme.headline5),
          subtitle: RatingBarIndicator(
            rating: rating,
            itemBuilder: (context, index) => Icon(
                Icons.star,
                color: kPrimaryColor,
            ),
            itemCount: 5,
            itemSize: 15.0,
            direction: Axis.horizontal,
          ), 
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(supportingText,
              style: Theme.of(context).textTheme.bodyText2),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Rating())),
          child: Text('LER MAIS')
          ),
      ],
    ));
  }
}
