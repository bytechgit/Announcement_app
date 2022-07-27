import 'dart:developer';

import 'package:audio_stream/addRoom.dart';
import 'package:audio_stream/addUser.dart';
import 'package:audio_stream/controllers/web_socket.dart';
import 'package:audio_stream/editRoom.dart';
import 'package:audio_stream/editUser.dart';
import 'package:audio_stream/listening.dart';
import 'package:audio_stream/login.dart';
import 'package:audio_stream/rooms.dart';
import 'package:audio_stream/speaking.dart';
import 'package:audio_stream/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarControler extends GetxController {
  final wsc = Get.find<WebSocketController>();
  var tabIndex = 3;
  final showNavBar = false.obs;
  List<Widget> screens = [
    const Speaking(),
    const Rooms(),
    const Users(),
    const Login(),
    const Login(),
    const Listening(),
    const AddRoom(),
    const AddUser(),
  ];
  var tabIndex1 = 4.obs;
  void changeTabIndex(int index) {
    if (index == 3) {
      Get.dialog(
        AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                Get.back();
                wsc.recorder.stop();
                wsc.listeningStream?.cancel();
                wsc.uc.logout();
                changeScreen(4);
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      );
    } else {
      if (index != 4 && index != 5) {
        showNavBar.value = true;
      } else {
        showNavBar.value = false;
      }
      tabIndex1.value = index;
      tabIndex = index;
      update();
    }
  }

  void changeScreen(int n) {
    tabIndex1.value = n;
    if (n != 4 && n != 5) {
      showNavBar.value = true;
    } else {
      showNavBar.value = false;
    }
    if (n < 4) {
      tabIndex = n;
      update();
    }
  }

  // void openProfile() {
  //   if (auth.user.value != null) {
  //     changeScreen(1); //profil
  //   } else {
  //     changeScreen(5); //login
  //   }
  // }
  void admin(bool admin) {
    if (admin) {
      changeScreen(0);
    } else {
      changeScreen(5);
    }
  }
}
