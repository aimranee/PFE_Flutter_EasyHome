class UserM {
  String userName, id, email, phone, image;
  UserM({this.email, this.id, this.userName, this.phone, this.image});
  static UserM current;
  factory UserM.fromJson(Map<String, dynamic> j) => UserM(
      email: j['email'],
      id: j['id'],
      userName: j['userName'],
      phone: j['phone'],image: j['image']);
  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "userName": userName,
        "phone": phone,
        "image":image,
      };
}
