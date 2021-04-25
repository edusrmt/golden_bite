import 'package:flutter/material.dart';
import 'package:golden_bite/models/user.dart';
import 'package:golden_bite/screens/festivals/festivals.dart';
import 'package:golden_bite/screens/guides/guides.dart';
import 'package:golden_bite/screens/login/login.dart';
import 'package:golden_bite/screens/profile/profile.dart';
import 'package:golden_bite/screens/myRatings/myRatings.dart';
import 'package:golden_bite/services/auth.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String nomeCompleto = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    User user = await Auth.getUser();

    setState(() {
      nomeCompleto = "${user.nome} ${user.sobrenome}";
      email = user.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(nomeCompleto, style: TextStyle(fontSize: 20.0)),
            accountEmail: Text(email),
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
              Auth.clearUser();
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
