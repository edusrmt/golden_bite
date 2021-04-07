import 'package:flutter/material.dart';
import 'package:golden_bite/screens/guide/guide.dart';

class GuideCard extends StatelessWidget {
  const GuideCard({Key key, this.headerText, this.supportingText})
      : super(key: key);

  final String headerText;
  final String supportingText;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Row(children: [
            Icon(Icons.stars, color: Theme.of(context).colorScheme.primary),
            SizedBox(
              width: 8,
            ),
            Text(headerText, style: Theme.of(context).textTheme.headline6)
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Text(supportingText,
              style: Theme.of(context).textTheme.bodyText2),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Guide()))
                    },
                child: Text('VISUALIZAR')),
          ],
        )
      ],
    ));
  }
}
