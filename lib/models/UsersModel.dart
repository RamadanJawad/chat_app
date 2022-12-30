class Users {
  String? id;
  String? name;
  String? email;
  String? password;

  Users({this.id, this.email, this.password, this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    return data;
  }

  Users.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
  }
}
