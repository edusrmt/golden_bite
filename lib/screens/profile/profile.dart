import 'package:flutter/material.dart';
import 'package:golden_bite/screens/profile/components/body.dart';

class Profile extends StatefulWidget {
  final int id;
  final String nome;
  final String sobrenome;
  final String cpf;
  final String email;

  const Profile(this.id, this.nome, this.sobrenome, this.cpf, this.email);

  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
          widget.id, widget.nome, widget.sobrenome, widget.cpf, widget.email),
    );
  }
}
