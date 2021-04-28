import 'package:flutter/material.dart';
import 'package:golden_bite/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:golden_bite/models/rating.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({Key key, this.rating}) : super(key: key);

  final Rating rating;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(rating.pratoNome,
              style: Theme.of(context).textTheme.headline5),
          subtitle: Row(
            children: <Widget>[
              RatingBarIndicator(
                rating: rating.nota.toDouble(),
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: kPrimaryColor,
                ),
                itemCount: 5,
                itemSize: 15.0,
                direction: Axis.horizontal,
              ),
              Text(rating.festivalNome)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
          child: Row(children: <Widget>[
            Text(rating.comentario,
                style: Theme.of(context).textTheme.bodyText2)
          ]),
        ),
      ],
    ));
  }
}
