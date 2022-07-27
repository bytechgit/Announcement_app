import 'dart:convert';
import 'dart:developer';

import 'package:audio_stream/models/userModel.dart';
import 'package:http/http.dart' as http;

String serverAddress =
    "http://vargapp-env.eba-is6gvbmw.us-east-1.elasticbeanstalk.com";

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

  Future<void> loadUsers() async {
    if (users.isEmpty) {
      try {
        final response = await http.post(
          Uri.parse('$serverAddress/loadUsersFromRoom'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'roomId': roomId,
          }),
        );
        inspect(response);
        if (response.statusCode == 200) {
          users = (jsonDecode(response.body) as List)
              .map((element) => element.toString())
              .toList();
        } else {}
      } catch (e) {
        print(e);
      }
    }
  }
}
