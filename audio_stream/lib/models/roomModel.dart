class RoomModel {
  String roomId;
  RoomModel({
    required this.roomId,
  });

  Map<String, dynamic> toJson() => {
        'roomId': roomId,
      };
  RoomModel.fromJson(Map<String, dynamic> map) : roomId = map["roomId"];
}
