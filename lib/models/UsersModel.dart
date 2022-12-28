class Users {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;

  Users({this.id, this.email, this.password, this.name, this.phone});

  toJson() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }

  Users.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
  }
}
