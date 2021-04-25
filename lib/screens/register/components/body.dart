import 'package:flutter/material.dart';
import 'package:golden_bite/screens/login/login.dart';
import 'package:golden_bite/screens/register/register.dart';
import 'package:golden_bite/services/api.dart';
import 'package:golden_bite/components/background.dart';
import 'package:golden_bite/components/rounded_button.dart';
import 'package:golden_bite/components/rounded_input_field.dart';
import 'package:golden_bite/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  API _api;

  String nome = "";
  String sobrenome = "";
  String cpf = "";
  String email = "";
  String senha = "";

  @override
  void initState() {
    super.initState();

    _api = new API();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              height: size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Nome",
              onChanged: (value) {
                setState(() {
                  nome = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "Sobrenome",
              onChanged: (value) {
                setState(() {
                  sobrenome = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "CPF",
              onChanged: (value) {
                setState(() {
                  cpf = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "E-mail",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  senha = value;
                });
              },
            ),
            RoundedButton(
              text: "CADASTRAR",
              press: () {
                _api
                    .createAccount(nome, sobrenome, cpf, email, senha)
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              value ? Login() : Register()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
