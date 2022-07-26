import 'package:audio_stream/addRoom.dart';
import 'package:audio_stream/addUser.dart';
import 'package:audio_stream/editRoom.dart';
import 'package:audio_stream/editUser.dart';
import 'package:audio_stream/listening.dart';
import 'package:audio_stream/login.dart';
import 'package:audio_stream/rooms.dart';
import 'package:audio_stream/speaking.dart';
import 'package:audio_stream/users.dart';
import 'package:get/get.dart';

class NavBarControler extends GetxController {
  var tabIndex = 3;
  final showNavBar = false.obs;
  final screens = [
    const Speaking(),
    const Rooms(),
    const Users(),
    const Login(),
    const Listening(),
    const AddRoom(),
    const AddUser(),
  ];
  var tabIndex1 = 3.obs;
  void changeTabIndex(int index) {
    if (index != 3 && index != 4) {
      showNavBar.value = true;
    } else {
      showNavBar.value = false;
    }
    tabIndex1.value = index;
    tabIndex = index;
    update();
  }

  void changeScreen(int n) {
    tabIndex1.value = n;
    if (n != 3 && n != 4) {
      showNavBar.value = true;
    } else {
      showNavBar.value = false;
    }
    if (n < 3) {
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
      changeScreen(4);
    }
  }
}
