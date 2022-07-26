import 'dart:async';
import 'dart:convert';
import 'package:audio_stream/homepage.dart';
import 'package:audio_stream/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navBarControler.dart';
import 'controllers/user_controller.dart';
import 'controllers/web_socket.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();

  final uc = Get.put(UserController(prefs: prefs));
  final wsc = Get.put(WebSocketController());
  final navbar = Get.put(NavBarControler());
  final userstring = prefs.getString("user");
  if (userstring != null) {
    uc.user.value = UserModel.fromJson(jsonDecode(userstring));
    if (uc.user.value != null) {
      wsc.listen();
      navbar.admin(uc.user.value!.admin);
      if (uc.user.value!.admin) {
        uc.getRooms();
        uc.getUsers();
      } else {
        wsc.play();
      }
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //final theme = Get.find<CustomTheme>();
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Homepage(),
        ));
  }
}
