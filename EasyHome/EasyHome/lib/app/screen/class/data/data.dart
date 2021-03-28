import 'package:easyhome/app/screen/class/annonce_parametre/annonce.dart';


final _annonce1 = Annonce(
  title: "this home is good",
  images: 'assets/images/house3.jpeg',
  address: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 2éme etage o mchemcha 3 chambre ...',
  price: 2000.00,
  rooms: 3,
  limitPersonne: 3,
  sqFeet: 200,
  isFav: false,
  ListImages: [
    'assets/images/house1.jpeg',
    'assets/images/indoor1.jpeg',
    'assets/images/indoor2.jpeg',
    'assets/images/indoor3.jpeg',
    'assets/images/indoor4.jpeg',
    'assets/images/indoor5.jpeg',
  ],
);

final _annonce2 = Annonce(
  title: "this home is good",
  images: 'assets/images/house3.jpeg',
  address: 'Elghawa, Saad Allah Hined',
  description:
      'daar kbira 1ére etage o mchemcha 3 chambre lmhm ikoon khiir incha llah...',
  price: 1900.00,
  rooms: 3,
  limitPersonne: 3,
  sqFeet: 200,
  isFav: false,
  ListImages: [
    'assets/images/house2.jpeg',
    'assets/images/indoor1.jpeg',
    'assets/images/indoor2.jpeg',
    'assets/images/indoor3.jpeg',
    'assets/images/indoor4.jpeg',
    'assets/images/indoor5.jpeg',
  ],
);

final _annonce3 = Annonce(
  title: "this home is good",
  images: 'assets/images/house5.jpeg',
  address: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 3éme etage o mchemcha 2 chambre ...',
  price: 1000.00,
  rooms: 2,
  limitPersonne: 3,
  sqFeet: 200,
  isFav: false,
  ListImages: [
    'assets/images/house1.jpeg',
    'assets/images/indoor1.jpeg',
    'assets/images/indoor2.jpeg',
    'assets/images/indoor3.jpeg',
    'assets/images/indoor4.jpeg',
    'assets/images/indoor5.jpeg',
  ],
);

final _annonce4 = Annonce(
  title: "this home is good",
  images: 'assets/images/house1.jpeg',
  address: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 3éme etage o mchemcha 2 chambre ...',
  price: 1000.00,
  rooms: 2,
  limitPersonne: 3,
  sqFeet: 200,
  isFav: false,
  ListImages: [
    'assets/images/house1.jpeg',
    'assets/images/indoor1.jpeg',
    'assets/images/indoor2.jpeg',
    'assets/images/indoor3.jpeg',
    'assets/images/indoor4.jpeg',
    'assets/images/indoor5.jpeg',
  ],
);

final _annonce5 = Annonce(
  images: 'assets/images/house2.jpeg',
  title: "best home for ever",
  address: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 3éme etage o mchemcha 2 chambre ...',
  price: 1300.00,
  rooms: 2,
  limitPersonne: 3,
  sqFeet: 200,
  isFav: false,
  ListImages: [
    'assets/images/house1.jpeg',
    'assets/images/indoor1.jpeg',
    'assets/images/indoor2.jpeg',
    'assets/images/indoor3.jpeg',
    'assets/images/indoor4.jpeg',
    'assets/images/indoor5.jpeg',
  ],
);

final _annonce6 = Annonce(
  images: 'assets/images/house5.jpeg',
  title: 'best home for ever',
  address: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 3éme etage o mchemcha 2 chambre ...',
  price: 1900.00,
  rooms: 2,
  limitPersonne: 3,
  sqFeet: 200,
  isFav: false,
  ListImages: [
    'assets/images/house1.jpeg',
    'assets/images/indoor1.jpeg',
    'assets/images/indoor2.jpeg',
    'assets/images/indoor3.jpeg',
    'assets/images/indoor4.jpeg',
    'assets/images/indoor5.jpeg',
  ],
);

final List<Annonce> annonceList = [
  _annonce1,
  _annonce2,
  _annonce3,
  _annonce4,
  _annonce5,
  _annonce6,
];


/*
Future _getImage(BuildContext context, String imageName) async {
  Image image;
  await FireStorageService.loadImge(context, imageName).then((value) {
    image = Image.network(
      value.toString(),
      fit: BoxFit.scaleDown,
    );
  });
  return image;
}

class FireStorageService extends Annonce {
  FireStorageService();
  static Future<dynamic> loadImge(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
*/