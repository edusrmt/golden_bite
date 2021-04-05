import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard(
      {Key key,
      this.headerText,
      this.media,
      this.supportingText,
      this.place,
      this.address})
      : super(key: key);

  final String headerText;
  final String media;
  final String supportingText;
  final String place;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(headerText, style: Theme.of(context).textTheme.headline5),
        ),
        Image.asset(media, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(supportingText,
              style: Theme.of(context).textTheme.bodyText2),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      place,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      address,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
                TextButton(
                    onPressed: () => print('AVALIAR'), child: Text('AVALIAR')),
              ],
            ))
      ],
    ));
  }
}
