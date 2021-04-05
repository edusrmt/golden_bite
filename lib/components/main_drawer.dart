import 'package:flutter/material.dart';
import 'package:golden_bite/screens/festivals/festivals.dart';
import 'package:golden_bite/screens/guides/guides.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: <Widget>[
              UserAccountsDrawerHeader(
              accountName: Text("João da Silva", style: TextStyle(fontSize: 20.0)),
              accountEmail: Text("joao@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 30.0,
                backgroundColor: Colors.transparent,
              ),
            ),
          ListTile(
            leading: Icon(Icons.list),
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
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Meu Perfil'),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
