import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/components/rounded_button.dart';
import 'package:golden_bite/components/rounded_input_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil')),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Align(
              alignment: Alignment.center,
            ),
            RoundedInputField(
              hintText: "João",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Silva",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "123.456.789-10",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "joao@email.com",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "EDITAR INFORMAÇÕES",
              press: () {},
            ),
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
