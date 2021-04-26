import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/components/rounded_button.dart';
import 'package:golden_bite/components/rounded_input_field.dart';
import 'package:golden_bite/models/user.dart';
import 'package:golden_bite/screens/profile/profile.dart';
import 'package:golden_bite/services/api.dart';
import 'package:golden_bite/services/auth.dart';

class Body extends StatefulWidget {
  final int id;
  final String nome;
  final String sobrenome;
  final String cpf;
  final String email;

  const Body(this.id, this.nome, this.sobrenome, this.cpf, this.email);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  API _api;

  int id;
  String nome = "";
  String sobrenome = "";
  String cpf = "";
  String email = "";
  String senha = "";

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    User user = await Auth.getUser();

    setState(() {
      id = user.id;
      nome = user.nome;
      sobrenome = user.sobrenome;
      cpf = user.cpf;
      email = user.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Editar Perfil')),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Align(
              alignment: Alignment.center,
            ),
            RoundedInputField(
              hintText: nome,
              onChanged: (value) {
                setState(() {
                  nome = value;
                });
              },
            ),
            RoundedInputField(
              hintText: sobrenome,
              onChanged: (value) {
                setState(() {
                  sobrenome = value;
                });
              },
            ),
            RoundedInputField(
              hintText: cpf,
              onChanged: (value) {
                setState(() {
                  cpf = value;
                });
              },
            ),
            RoundedInputField(
              hintText: email,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            RoundedButton(
              text: "SALVAR",
              press: () {
                _api.editProfile(id, nome, sobrenome, cpf, email).then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Profile(id, nome, sobrenome, cpf, email)));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
