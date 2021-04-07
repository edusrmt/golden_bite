import 'package:flutter/material.dart';
import 'package:golden_bite/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingCard extends StatelessWidget {
  const RatingCard(
      {Key key,
      this.headerText,
      this.rating,
      this.nameFestival,
      this.supportingText,
      this.festival})
      : super(key: key);

  final String headerText;
  final String nameFestival;
  final double rating;
  final String supportingText;
  final String festival;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(headerText, style: Theme.of(context).textTheme.headline5),
          subtitle: Row(
            children: <Widget>[
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: kPrimaryColor,
                ),
                itemCount: 5,
                itemSize: 15.0,
                direction: Axis.horizontal,
              ),
              Text(festival)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(supportingText,
              style: Theme.of(context).textTheme.bodyText2),
        ),
      ],
    ));
  }
}
