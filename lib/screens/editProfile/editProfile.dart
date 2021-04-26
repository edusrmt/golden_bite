import 'package:flutter/material.dart';
import 'package:golden_bite/screens/editProfile/components/body.dart';

class EditProfile extends StatefulWidget {
  final int id;
  final String nome;
  final String sobrenome;
  final String cpf;
  final String email;

  const EditProfile(this.id, this.nome, this.sobrenome, this.cpf, this.email);

  @override
  State<StatefulWidget> createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
          widget.id, widget.nome, widget.sobrenome, widget.cpf, widget.email),
    );
  }
}
