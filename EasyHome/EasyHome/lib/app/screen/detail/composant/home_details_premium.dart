import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:flutter/material.dart';

class HomeDetailsPremium extends StatefulWidget {
  final Annonce annoncePremium;

  HomeDetailsPremium(this.annoncePremium);

  @override
  _HomeDetailsPremiumState createState() => _HomeDetailsPremiumState();
}

class _HomeDetailsPremiumState extends State<HomeDetailsPremium> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Home information"),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Prix",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "${widget.annoncePremium.prix} DH",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(Icons.attach_money),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Addresse",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "${widget.annoncePremium.adresse}",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(Icons.location_searching),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Nombre des Personnes",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "${widget.annoncePremium.limitPersonne}",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(Icons.people),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Nombre de chambres",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "${widget.annoncePremium.rooms}",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(Icons.home_filled),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Prix",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "${widget.annoncePremium.tele}",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: Icon(Icons.call),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "",
                    style: TextStyle(),
                  ),
                  subtitle: Text(""),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
