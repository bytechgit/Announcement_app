import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'PlayButton.dart';

class Speaking extends StatefulWidget {
  const Speaking({Key? key}) : super(key: key);

  @override
  State<Speaking> createState() => _SpeakingState();
}

List rooms = ['Room 1', 'Room 2', 'Room 3', 'Room 4'];

class _SpeakingState extends State<Speaking> {
  //final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
            bottomNavigationBar: BottomNavigationBar(
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
                      items: rooms,
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
                        pauseIcon: const Icon(Icons.mic_rounded,
                            color: Color.fromARGB(255, 2, 83, 154), size: 90),
                        playIcon: const Icon(Icons.mic_off_rounded,
                            color: Color.fromARGB(255, 2, 83, 154), size: 90),
                        onPressed: () {},
                      )
                      // ),
                      ),
                ),
                // Icon(
                //   Icons.mic,
                //   size: 150,
                // ),
                Expanded(child: Container())
              ],
            )));
  }
}
