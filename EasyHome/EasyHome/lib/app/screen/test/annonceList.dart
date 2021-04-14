import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnnonceList extends StatefulWidget {
  @override
  _AnnonceListState createState() => _AnnonceListState();
}

class _AnnonceListState extends State<AnnonceList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Annonce> annonces = Provider.of<List<Annonce>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: ListView.builder(
          itemCount: annonces.length,
          itemBuilder: (ctx, i) {
            final annonce = annonces[i];
            return annonce.type == AnnonceType.annonce
                ? ListTile(
                    subtitle: Text(annonce.title),
                    leading: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            height: 120,
                            width: size.width,
                            fit: BoxFit.cover,
                            image: AssetImage(annonce.images.first),
                          )),
                    ),
                  )
                : Container();
          }),
    );
  }
}
