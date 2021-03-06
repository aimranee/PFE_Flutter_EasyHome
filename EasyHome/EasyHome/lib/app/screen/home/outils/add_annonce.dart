import 'dart:io';
import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:easyhome/app/services/db.dart';
import 'package:easyhome/app/sign_in_page/composant/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'get_image.dart';

class AddAnnonce extends StatefulWidget {
  @override
  _AddAnnonceState createState() => _AddAnnonceState();
}

class _AddAnnonceState extends State<AddAnnonce> {
  final key = GlobalKey<FormState>();
  String titre, tele, nbrChambre, prix, adresse, description, nbrPersonne;
  Annonce annonce = Annonce();
  List<File> images = [];
  @override
  initState() {
    super.initState();
    annonce.type = AnnonceType.annonce;
  }

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
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => nbrChambre = e,
                    decoration: InputDecoration(
                      hintText: "Nombre des chambres",
                      labelText: "Chambres",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
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
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => nbrPersonne = e,
                    decoration: InputDecoration(
                      hintText: "nombre",
                      labelText: "nombre des personne",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
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
                      hintText: "T??l??phone",
                      labelText: "T??l??phone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e.isEmpty ? "Remplire ce champ" : null,
                    onChanged: (e) => adresse = e,
                    decoration: InputDecoration(
                      hintText: "Localisation",
                      labelText: "Localisation",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
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
                      hintText: "D??taile suppl??mentaires",
                      labelText: "D??tails",
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
                            if (data != null)
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
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.lightBlue,
                          onPressed: () async {
                            if (key.currentState.validate()) {
                              loading(context);

                              annonce.title = titre;
                              annonce.adresse = adresse;
                              annonce.tele = tele;
                              annonce.rooms = nbrChambre;
                              annonce.prix = prix;
                              annonce.description = description;
                              annonce.limitPersonne = nbrPersonne;
                              annonce.images = [];
                              annonce.uid =
                                  FirebaseAuth.instance.currentUser.uid;
                              for (int i = 0; i < images.length; i++) {
                                String urlImage = await DBServices()
                                    .uploadImage(images[i], path: "annonce");
                                if (urlImage != null)
                                  annonce.images.add(urlImage);
                              }
                              if (images.length == annonce.images.length) {
                                bool save =
                                    await DBServices().saveAnnonce(annonce);
                                if (save) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                }
                              }
                            }
                          },
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
