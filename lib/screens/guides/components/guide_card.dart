import 'package:flutter/material.dart';
import 'package:golden_bite/screens/guide/guide.dart';
import 'package:golden_bite/models/guide.dart';

class GuideCard extends StatelessWidget {
  const GuideCard({Key key, this.guide}): super(key: key);

  final Guide guide;

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
            Text(guide.nome, style: Theme.of(context).textTheme.headline6)
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Text(guide.descricao,
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
                              builder: (BuildContext context) => GuideDetail(guide.pratos, guide.nome)))
                    },
                child: Text('VISUALIZAR')),
          ],
        )
      ],
    ));
  }
}
