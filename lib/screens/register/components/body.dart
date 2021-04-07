import 'package:flutter/material.dart';
import 'package:golden_bite/screens/festivals/festivals.dart';
import 'package:golden_bite/components/background.dart';
import 'package:golden_bite/components/rounded_button.dart';
import 'package:golden_bite/components/rounded_input_field.dart';
import 'package:golden_bite/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Sobrenome",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "CPF",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "E-mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "CADASTRAR",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Festivals()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
