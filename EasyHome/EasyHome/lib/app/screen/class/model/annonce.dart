class Annonce {
  String id;
  String uid;
  String title;
  String adresse;
  String description;
  String prix;
  String tele;
  String rooms;
  String limitPersonne;
  bool isFav;
  AnnonceType type;
  List<String> images;

  Annonce({
    this.id,
    this.uid,
    this.title,
    this.images,
    this.adresse,
    this.description,
    this.prix,
    this.tele,
    this.rooms,
    this.limitPersonne,
    this.isFav,
    this.type,
  });
  factory Annonce.fromJson(Map<String, dynamic> map) => Annonce(
      //id: id,
      adresse: map["adresse"],
      description: map["description"],
      prix: map["prix"],
      limitPersonne: map["limitPersonne"],
      rooms: map["rooms"],
      tele: map["tele"],
      title: map["title"],
      uid: map["uid"],
      images: map["images"].map<String>((i) => i as String).toList(),
      type: map["type"] == "annonce"
          ? AnnonceType.annonce
          : AnnonceType.annoncePrmiem);

  Map<String, dynamic> toMap() {
    return {
      "type": type == AnnonceType.annonce ? "annonce" : "annoncePremiem",
      "ListeImages": images,
      "title": title,
      "uid": uid,
      "adresse": adresse,
      "description": description,
      "prix": prix,
      "tele": tele,
      "rooms": rooms,
      "limitPersonne": limitPersonne
    };
  }
}

enum AnnonceType { annonce, annoncePrmiem }
