import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navBarControler.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final navBar = Get.find<NavBarControler>();

    return GetBuilder<NavBarControler>(builder: (controller) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Obx(
          () => Scaffold(
            bottomNavigationBar: navBar.showNavBar.value
                ? SizedBox(
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
                  )
                : null,
            body: Obx(
              () => IndexedStack(
                index: controller.tabIndex1.value,
                children: navBar.screens,
              ),
            ),
          ),
        ),
      );
    });
  }
}
