import 'dart:convert';
import 'dart:developer';
import 'package:audio_stream/models/roomModel.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/userModel.dart';

class UserController extends GetxController {
  final user = Rx<UserModel?>(null);
  final rooms = Rx<List<RoomModel>>([]);
  final users = Rx<List<UserModel>>([]);
  SharedPreferences prefs;
  String? selectedRoom;
  UserController({required this.prefs});
  String serverAddress =
      "http://vargapp-env.eba-is6gvbmw.us-east-1.elasticbeanstalk.com";
  Future<int> login(
      {required String username, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('$serverAddress/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      inspect(response);
      if (response.statusCode == 200) {
        user.value = UserModel.fromJson(jsonDecode(response.body));
        prefs.setString("user", response.body);

        if (user.value!.admin) {
          getRooms();
          getUsers();
          return 1;
        }

        return 2;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  ////add user
  ///
  Future<String> addUser(
      {required String username,
      required String password,
      required bool admin,
      required List<String> rooms}) async {
    try {
      final user = UserModel(
          username: username, password: password, admin: admin, rooms: rooms);
      print("kjkk");
      final response = await http.post(
        Uri.parse('$serverAddress/addUser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'user': user.toJson(),
        }),
      );
      inspect(response);
      if (response.statusCode == 200) {
        users.value.add(user);
        users.refresh();
        return "User added successfully";
      } else {
        return response.body.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  ////
  ///
  ///add user to room
  ///
  Future<bool> updateRoom({required RoomModel room}) async {
    try {
      final response = await http.post(
        Uri.parse('$serverAddress/updateRoom'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'room': room.toJson()}),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /////
  ///
  ///add room
  ///
  Future<String> addRoom(
      {required String roomId, required List<String> users}) async {
    try {
      final response = await http.post(
        Uri.parse('$serverAddress/addRoom'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'roomId': roomId, 'users': users}),
      );
      inspect(response);
      if (response.statusCode == 200) {
        rooms.value.add(RoomModel(roomId: roomId, users: users));
        rooms.refresh();
        return "Room added successfully";
      } else if (response.statusCode == 398) {
        return "Room already exist";
      } else {
        return response.body.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  ////
  ///
  ///delete room
  ///
  Future<bool> deleteRoom({required String roomId}) async {
    try {
      final response = await http.post(
        Uri.parse('$serverAddress/deleteRoom'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'roomId': roomId}),
      );
      inspect(response);
      if (response.statusCode == 200) {
        rooms.value.removeWhere((element) => element.roomId == roomId);
        rooms.refresh();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  ////
  ///
  ///delete user
  ///
  Future<bool> deleteUser({required String username}) async {
    try {
      final response = await http.post(
        Uri.parse('$serverAddress/deleteUser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'username': username}),
      );
      inspect(response);
      if (response.statusCode == 200) {
        users.value.removeWhere((element) => element.username == username);
        users.refresh();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  ///
  ////
  ///
  ///update user
  ///

  Future<String> updateUser({required UserModel u}) async {
    try {
      final response = await http.post(
        Uri.parse('$serverAddress/updateUser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'user': u.toJson()}),
      );
      if (response.statusCode == 200) {
        return "User updated successfully";
      } else {
        return response.body.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

////
  ///
  ///
  ///get rooms
  ///
  Future<String> getRooms() async {
    try {
      final response = await http.post(
        Uri.parse('$serverAddress/loadRooms'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      inspect(response);
      if (response.statusCode == 200) {
        rooms.value = (jsonDecode(response.body) as List)
            .map((e) => RoomModel.fromJson(e))
            .toList();

        inspect(rooms);
        return "Loaded successfully";
      } else {
        return response.body.toString();
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  ///
  ////
  ///get users
  ///
  Future<String> getUsers() async {
    try {
      final response = await http.post(
        Uri.parse('$serverAddress/loadUsers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      inspect(response);
      if (response.statusCode == 200) {
        users.value = (jsonDecode(response.body) as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
        inspect(users);
        return "Loaded successfully";
      } else {
        return response.body.toString();
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  /////hive
  ///
  ///

}
