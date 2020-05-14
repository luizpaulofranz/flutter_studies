class Contact {

  Contact.fromMap(Map map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
    phone = map["phone"];
    imgPath = map["imgPath"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "name": name,
      "email": email,
      "phone": phone,
      "imgPath": imgPath
    };
    if(id != null) {
      map["id"] =  id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name, email:$email, phone: $phone, imgPath: $imgPath)";
  }

  int id;
  String name;
  String email;
  String phone;
  String imgPath;
}