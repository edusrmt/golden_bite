import 'package:flutter/material.dart';
import 'package:golden_bite/screens/festival/festival.dart';

class FestivalCard extends StatelessWidget {
  const FestivalCard(
      {Key key,
      this.headerText,
      this.subhead = '',
      this.media,
      this.supportingText})
      : super(key: key);

  final String headerText;
  final String subhead;
  final String media;
  final String supportingText;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(headerText, style: Theme.of(context).textTheme.headline5),
          subtitle: Text(subhead, style: Theme.of(context).textTheme.bodyText2),
          trailing: Icon(Icons.share),
        ),
        Image.asset(media, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(supportingText,
              style: Theme.of(context).textTheme.bodyText2),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Festival())),
                child: Text('VISUALIZAR')),
          ],
        )
      ],
    ));
  }
}
