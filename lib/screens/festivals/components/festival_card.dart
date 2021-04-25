import 'package:flutter/material.dart';
import 'package:golden_bite/screens/festival/festival.dart';
import 'package:golden_bite/services/api.dart';
import 'package:golden_bite/models/festival.dart';

class FestivalCard extends StatelessWidget {
  const FestivalCard({Key key, this.festival}) : super(key: key);

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title:
              Text(festival.nome, style: Theme.of(context).textTheme.headline5),
          subtitle: Text(festival.tempoRestante(),
              style: Theme.of(context).textTheme.bodyText2),
          trailing: Icon(Icons.share),
        ),
        FadeInImage.assetNetwork(
          placeholder: 'assets/card_image_placeholder.jpg',
          image: Uri.http(API.baseUrl, festival.capa).toString(),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(festival.descricao,
              style: Theme.of(context).textTheme.bodyText2),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FestivalDetail(festival.pratos, festival.nome))),
                child: Text('VISUALIZAR')),
          ],
        )
      ],
    ));
  }
}
