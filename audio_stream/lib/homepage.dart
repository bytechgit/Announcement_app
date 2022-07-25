import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navBarControler.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    //final theme = Get.find<CustomTheme>();

    return GetBuilder<NavBarControler>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: const Color.fromARGB(255, 2, 83, 154),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.mic,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: '',
              ),
            ],
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex1.value,
            children: Get.find<NavBarControler>().screens,
          ),
        ),
      );
    });
  }
}
