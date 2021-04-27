import 'package:flutter/material.dart';
import 'package:golden_bite/services/api.dart';
import 'package:golden_bite/models/food.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key key, this.food}) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(food.nome, style: Theme.of(context).textTheme.headline6),
        ),
        FadeInImage.assetNetwork(
          placeholder: 'assets/card_image_placeholder.jpg',
          image: Uri.http(API.baseUrl, food.capa).toString(),
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: <Widget>[
            Text(food.ingredientes,
                style: Theme.of(context).textTheme.bodyText2)
          ]),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      food.restauranteNome,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      food.restauranteEndereco,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ],
            ))
      ],
    ));
  }
}
