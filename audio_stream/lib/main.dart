import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navBarControler.dart';
import 'controllers/user_controller.dart';
import 'controllers/web_socket.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(WebSocketController());
  Get.put(UserController());
  Get.put(NavBarControler());
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
        home: Scaffold(
          body: Login(),
        ));
  }
}
