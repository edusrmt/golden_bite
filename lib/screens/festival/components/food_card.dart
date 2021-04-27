import 'package:flutter/material.dart';
import 'package:golden_bite/screens/rating/rating.dart';
import 'package:golden_bite/services/api.dart';
import 'package:golden_bite/models/food.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({this.food, this.festivalName});

  final Food food;
  final String festivalName;

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.food.nome,
              style: Theme.of(context).textTheme.headline5),
        ),
        FadeInImage.assetNetwork(
          placeholder: 'assets/card_image_placeholder.jpg',
          image: Uri.http(API.baseUrl, widget.food.capa).toString(),
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(widget.food.ingredientes,
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
                      widget.food.restauranteNome,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.food.restauranteEndereco,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Rating(
                                widget.food.nome,
                                widget.food.restauranteNome,
                                widget.festivalName))),
                    child: Text('AVALIAR')),
              ],
            ))
      ],
    ));
  }
}
