import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'PlayButton.dart';

class speaking extends StatefulWidget {
  const speaking({Key? key}) : super(key: key);

  @override
  State<speaking> createState() => _speakingState();
}

List Rooms = ['Room 1', 'Room 2', 'Room 3', 'Room 4'];

class _speakingState extends State<speaking> {
  @override
  final TextEditingController _controller = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Color.fromARGB(255, 2, 83, 154),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.mic,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
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
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: SizedBox(
                    child: DropdownSearch(
                      // dropdownSearchDecoration: InputDecoration(
                      //labelText: "Menu mode",
                      //  ),
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Room",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: Rooms,
                      showSearchBox: true,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: PlayButton(
                      pauseIcon: Icon(Icons.mic_rounded,
                          color: Color.fromARGB(255, 2, 83, 154), size: 90),
                      playIcon: Icon(Icons.mic_off_rounded,
                          color: Color.fromARGB(255, 2, 83, 154), size: 90),
                      onPressed: () {},
                    ),
                    // Blob(
                    //   color: Color(0xff0092ff), // color blue
                    //   scale: 1,
                    //   rotation: 0,
                    // ),
                  ),
                ),
                // Icon(
                //   Icons.mic,
                //   size: 150,
                // ),
                Expanded(child: Container())
              ],
            )

            // DropdownSearch<String>(
            //   popupProps: PopupProps.menu(
            //     showSelectedItems: true,
            //     disabledItemFn: (String s) => s.startsWith('I'),
            //   ),
            //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            //   // dropdownSearchDecoration:  InputDecoration(
            //   //     labelText: "Menu mode",
            //   //     hintText: "country in menu mode",
            //   // ),
            //   onChanged: print,
            //   selectedItem: "Brazil",
            // )
            ));
  }
}
