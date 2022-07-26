class RoomModel {
  String roomId;
  List<String> users;
  RoomModel({required this.roomId, required this.users});

  Map<String, dynamic> toJson() => {'roomId': roomId, 'users': users};
  RoomModel.fromJson(Map<String, dynamic> map)
      : roomId = map["roomId"],
        users = (((map["users"] ?? []) as List<dynamic>)
            .map((e) => e.toString())
            .toList());
}
