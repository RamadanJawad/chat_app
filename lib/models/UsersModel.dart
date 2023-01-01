class Users {
  String? id;
  String? name;
  String? email;
  String? password;
  String? image;

  Users({this.id, this.email, this.password, this.name, this.image});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['imageUrl'] = image;
    return data;
  }

  Users.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    image = data['imageUrl'];
  }
}
