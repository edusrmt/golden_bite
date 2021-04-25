import 'package:flutter/material.dart';
import 'package:golden_bite/models/user.dart';
import 'package:golden_bite/screens/login/login.dart';
import 'package:golden_bite/services/api.dart';
import 'package:golden_bite/screens/festivals/festivals.dart';
import 'package:golden_bite/components/background.dart';
import 'package:golden_bite/components/rounded_button.dart';
import 'package:golden_bite/components/rounded_input_field.dart';
import 'package:golden_bite/components/rounded_password_field.dart';
import 'package:golden_bite/screens/register/register.dart';
import 'package:golden_bite/services/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  API _api;

  String email;
  String senha;

  @override
  void initState() {
    super.initState();

    _api = new API();
    autoLogin();
  }

  void autoLogin() async {
    User user = await Auth.getUser();

    if (user.id != -1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Festivals()));
    }
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
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/logo.png",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
                hintText: "E-mail",
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                }),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  senha = value;
                });
              },
            ),
            SizedBox(height: 12),
            RoundedButton(
              text: "ENTRAR",
              press: () {
                _api.login(email, senha).then((value) {
                  if (value.id == -1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Login()));
                  } else {
                    Auth.storeUser(value);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Festivals()));
                  }
                });
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Register()));
              },
              child: Text(
                "Cadastre-se",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
