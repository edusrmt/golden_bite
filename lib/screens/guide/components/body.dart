import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/screens/guide/components/food_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Melhor Hambúruger')),
      drawer: MainDrawer(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
          IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            alignment: Alignment.centerLeft,
          ),
          FoodCard(
            headerText: '1. CHEDDAR LOUCO',
            media: 'assets/hamburger.jpg',
            supportingText:
                'Molho de tomate, linguiça fresca, cebola roxa, alho, manjericão, picles de jalapeño, parmesão.',
            place: 'Black House Hambúrgueria',
            address: 'Av. Salgado Filho, 3693',
          ),
          SizedBox(height: 15),
          FoodCard(
              headerText: '2. PRATICAMENTE INOFENSÍVEL',
              media: 'assets/hamburger.jpg',
              supportingText:
                  'Mozzarella de Búfala, rúcula temperada, parmesão.',
              place: 'Milliways - A Hamburgueria no Fim do Universo',
              address: 'Av. Roberto Freire, 256'),
        ],
      ),
    );
  }
}
