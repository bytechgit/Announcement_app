class UserModel {
  String username;
  String password;
  List<String>? rooms;
  bool admin;
  UserModel(
      {required this.username,
      required this.password,
      required this.admin,
      this.rooms});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'admin': admin,
        'rooms': rooms
      };
  UserModel.fromJson(Map<String, dynamic> map)
      : username = map["username"],
        password = map["password"],
        admin = map["admin"],
        rooms = (((map["rooms"] ?? []) as List<dynamic>)
            .map((e) => e.toString())
            .toList());
}
