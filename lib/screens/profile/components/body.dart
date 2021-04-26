import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/components/rounded_button.dart';
import 'package:golden_bite/components/rounded_input_field.dart';
import 'package:golden_bite/models/user.dart';
import 'package:golden_bite/screens/editProfile/editProfile.dart';
import 'package:golden_bite/services/api.dart';

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
  Future<User> futureUser;
  @override
  void initState() {
    super.initState();

    _api = new API();
    futureUser = _api.fetchUser(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil')),
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
              hintText: widget.nome,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: widget.sobrenome,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: widget.cpf,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: widget.email,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "EDITAR INFORMAÇÕES",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EditProfile(
                            widget.id,
                            widget.nome,
                            widget.sobrenome,
                            widget.cpf,
                            widget.email)));
              },
            ),
            SizedBox(height: 12),
            RoundedButton(
              text: "ALTERAR SENHA",
              press: () {},
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "EXCLUIR CONTA",
                style: TextStyle(color: Color(0xFFDD4F4F)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
