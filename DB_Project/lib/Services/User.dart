class User {
  int? id;
  late String username;
  String? password;
  String? email;

  User({required this.username, this.id, this.password, this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password ?? "",
      'email': email ?? ""
    };
  }
}
