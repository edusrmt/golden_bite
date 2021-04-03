import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golden_bite/screens/festivals/local_widgets/festival_card.dart';

class FestivalsPage extends StatefulWidget {
  @override
  _FestivalsPageState createState() => _FestivalsPageState();
}

class _FestivalsPageState extends State<FestivalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Festivais'),
        leading: Icon(Icons.menu),
      ),
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
