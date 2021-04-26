import 'package:flutter/material.dart';
import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/screens/myRatings/components/rating_card.dart';
import 'package:golden_bite/models/rating.dart';
import 'package:golden_bite/services/api.dart';
import 'package:golden_bite/services/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int idUser;
  API _api;
  Future<List<Rating>> futureRating;

  getUserData() async {
    await Auth.getUser().then((user) {
      setState(() {
        idUser = user.id;
      });
      futureRating = _api.fetchRating(idUser);
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
    _api = new API();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minhas Avaliações')),
      drawer: MainDrawer(),
      body: FutureBuilder<List<Rating>>(
          future: futureRating,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemBuilder: (context, index) =>
                      RatingCard(rating: snapshot.data[index]));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.primary),
              ));
            }

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              default:
            }

            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == false) {
              return Text("Nada aqui.");
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          }),
    );
  }
}
