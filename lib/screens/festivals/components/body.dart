import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/screens/festivals/components/festival_card.dart';
class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Festivais'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        children: <Widget>[
          FestivalCard(
            headerText: 'Melhor Pizza',
            subhead: 'restam 5 dias',
            media: 'assets/pizza.jpg',
            supportingText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
          ),
          SizedBox(height: 15),
          FestivalCard(
              headerText: 'Melhor Hambúrguer',
              subhead: 'resta 1 dia',
              media: 'assets/hamburger.jpg',
              supportingText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'),
        ],
      ),
    );
  }
}