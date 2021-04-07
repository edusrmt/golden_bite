import 'package:flutter/material.dart';
import 'package:golden_bite/screens/festivals/festivals.dart';
import 'package:golden_bite/screens/guides/guides.dart';
import 'package:golden_bite/screens/login/login.dart';
import 'package:golden_bite/screens/profile/profile.dart';
import 'package:golden_bite/screens/myRatings/myRatings.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName:
                Text("João da Silva", style: TextStyle(fontSize: 20.0)),
            accountEmail: Text("joao@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
              radius: 30.0,
              backgroundColor: Colors.transparent,
            ),
          ),
          ListTile(
            leading: Icon(Icons.stars),
            title: Text('Festivais'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Festivals()));
            },
          ),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Guias'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Guides()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Minhas Avaliações'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyRatings()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Meu Perfil'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
            },
          ),
        ],
      ),
    );
  }
}
