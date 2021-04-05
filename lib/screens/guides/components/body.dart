import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/screens/guides/components/guide_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guias')), drawer: MainDrawer(),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        children: <Widget>[
          GuideCard(
            headerText: 'MELHOR PIZZA',
            supportingText: 'Confira o ranking das melhores pizzas de Natal.',
          ),
          SizedBox(height: 15),
          GuideCard(
            headerText: 'MELHOR HAMBÚRGUER',
            supportingText:
                'Confira o ranking dos melhores hambúrgueres de Natal.',
          ),
        ],
      ),
    );
  }
}
