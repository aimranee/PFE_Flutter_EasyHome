import 'dart:io';

import 'package:flutter/material.dart';
import 'get_image.dart';

class AddAnnonce extends StatefulWidget {
  @override
  _AddAnnonceState createState() => _AddAnnonceState();
}

class _AddAnnonceState extends State<AddAnnonce> {
  final key = GlobalKey<FormState>();
  String titre, tele, nbrchambre, prix, localisation, description;
  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Ajouter une annonce",
              style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => titre = e,
                    decoration: InputDecoration(
                      hintText: "Titre de la annonce",
                      labelText: "Titre",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => nbrchambre = e,
                    decoration: InputDecoration(
                      hintText: "Nombre des chambres",
                      labelText: "Chambres",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => prix = e,
                    decoration: InputDecoration(
                      hintText: "Prix",
                      labelText: "Prix",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => tele = e,
                    decoration: InputDecoration(
                      hintText: "Téléphone",
                      labelText: "Téléphone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => localisation = e,
                    decoration: InputDecoration(
                      hintText: "Localisation",
                      labelText: "Localisation",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => description = e,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Détaile supplèmentaires",
                      labelText: "Détails",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      for (int i = 0; i < images.length; i++)
                        Container(
                            margin: EdgeInsets.only(right: 5, bottom: 5),
                            height: 60,
                            width: 60,
                            child: Stack(
                              children: [
                                Image.file(
                                  images[i],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        images.removeAt(i);
                                      });
                                    },
                                  ),
                                )
                              ],
                            )),
                      InkWell(
                          onTap: () async {
                            final data = await showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return GetImage();
                                });
                            setState(() {
                              images.add(data);
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey,
                            child: Icon(Icons.add),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: deprecated_member_use
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.lightBlue,
                          onPressed: () {},
                          child: Text(
                            "Annoncer",
                            style: TextStyle(color: Colors.white),
                          )))
                ],
              ),
            ),
          ),
        ));
  }
}
