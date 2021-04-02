/*import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce.dart';
import 'package:easyhome/app/services/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MotoList extends StatefulWidget {
  @override
  _MotoListState createState() => _MotoListState();
}

class _MotoListState extends State<MotoList> {
  @override
  Widget build(BuildContext context) {
    final List<Annonce> annonce = Provider.of<List<Annonce>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste de Motos"),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: annonce.length,
        itemBuilder: (context, i) {
          //final car = motos[i];
          //  return Text(annonce[i].); // i == motos.length - 1
          /*  ? Container(
                            child: VCard(car: car),
                            margin: EdgeInsets.only(bottom: 80),
                          )
                        : VCard(car: car);*/
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => AddAnnonce()));
        },
      ),
    );
  }
}
*/