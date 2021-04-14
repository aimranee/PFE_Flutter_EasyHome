import 'package:easyhome/app/screen/class/model/annonce.dart';

final _annonce1 = Annonce(
  title: "this home is good",
  adresse: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 2éme etage 3 chambre ...',
  prix: "2000.00",
  rooms: "3",
  tele: "0612345678",
  limitPersonne: "3",
  isFav: false,
  images: [
    'assets/images/home1.jpeg',
    'assets/images/home2.jpeg',
    'assets/images/home3.jpeg',
    'assets/images/home4.jpeg',
    'assets/images/home5.jpeg',
    'assets/images/home6.jpeg',
  ],
);

final _annonce2 = Annonce(
  title: "this home is good",
  adresse: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 1ére etage 3 chambre ..',
  prix: "1900.00",
  tele: "0612345678",
  rooms: "3",
  limitPersonne: "3",
  isFav: false,
  images: [
    'assets/images/home7.jpeg',
    'assets/images/home8.jpeg',
    'assets/images/home9.jpeg',
    'assets/images/home10.jpeg',
    'assets/images/home11.jpeg',
    'assets/images/home12.jpeg',
  ],
);

final _annonce3 = Annonce(
  title: "this home is good",
  adresse: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 3éme etage o mchemcha ...',
  prix: "1000.00",
  rooms: "2",
  limitPersonne: "3",
  isFav: false,
  tele: "0612345678",
  images: [
    'assets/images/home13.jpeg',
    'assets/images/home14.jpeg',
    'assets/images/home15.jpeg',
    'assets/images/home16.jpeg',
    'assets/images/home17.jpeg',
    'assets/images/home18.jpeg',
  ],
);

final _annonce4 = Annonce(
  title: "this home is good",
  adresse: 'Elghawa, Saad Allah Hined',
  description: 'daar kbira 3éme etage o mchemcha 2 chambre ...',
  prix: "1000.00",
  rooms: "2",
  limitPersonne: "3",
  tele: "0612345678",
  isFav: false,
  images: [
    'assets/images/home19.jpeg',
    'assets/images/home5.jpeg',
    'assets/images/home14.jpeg',
    'assets/images/home10.jpeg',
    'assets/images/home16.jpeg',
    'assets/images/home7.jpeg',
  ],
);

final List<Annonce> annonceList = [
  _annonce1,
  _annonce2,
  _annonce3,
  _annonce4,
];
