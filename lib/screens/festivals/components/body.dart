import 'package:flutter/material.dart';
import 'package:golden_bite/models/festival.dart';
import 'package:golden_bite/services/api.dart';

import 'package:golden_bite/components/main_drawer.dart';
import 'package:golden_bite/screens/festivals/components/festival_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  API _api;
  Future<List<Festival>> futureFestivals;

  @override
  void initState() {
    super.initState();

    _api = new API();
    futureFestivals = _api.fetchFestivals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Festivais'),
      ),
      drawer: MainDrawer(),
      body: FutureBuilder<List<Festival>>(
          future: futureFestivals,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemBuilder: (context, index) =>
                      FestivalCard(festival: snapshot.data[index]));
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
