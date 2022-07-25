import 'package:audio_stream/rooms.dart';
import 'package:audio_stream/speaking.dart';
import 'package:audio_stream/users.dart';
import 'package:get/get.dart';

class NavBarControler extends GetxController {
  var tabIndex = 0;
  final screens = [Speaking(), Rooms(), Users()];
  var tabIndex1 = 0.obs;
  void changeTabIndex(int index) {
    tabIndex1.value = index;
    tabIndex = index;
    update();
  }

  void changeScreen(int n) {
    tabIndex1.value = n;
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
}
