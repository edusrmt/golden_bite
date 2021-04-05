import 'package:flutter/material.dart';
import 'package:golden_bite/screens/festival/components/food_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Melhor Pizza'), leading: Icon(Icons.menu)),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        children: <Widget>[
          FoodCard(
            headerText: 'SR. FALCO',
            media: 'assets/pizza.jpg',
            supportingText:
                'Molho de tomate, linguiça fresca, cebola roxa, alho, manjericão, picles de jalapeño, parmesão.',
            place: 'Curva do Vento',
            address: 'Av. Salgado Filho, 3693',
          ),
          SizedBox(height: 15),
          FoodCard(
              headerText: 'COBRAVERDE',
              media: 'assets/pizza.jpg',
              supportingText:
                  'Mozzarella de Búfala, rúcula temperada, parmesão.',
              place: 'Brazz Eletrica',
              address: 'Rua Luiz Dias, 234'),
        ],
      ),
    );
  }
}
