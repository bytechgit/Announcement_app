import 'package:audio_stream/models/room.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'addRoom.dart';

class rooms extends StatefulWidget {
  const rooms({Key? key}) : super(key: key);

  @override
  State<rooms> createState() => _roomsState();
}

List Rooms = [
  'Room 1',
  'Room 2',
  'Room 3',
  'Room 4',
  'Room 5',
  'Room 6',
  'Room 7',
  'Room 8'
];

class _roomsState extends State<rooms> {
  @override
  final TextEditingController controller = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    labelText: "Rooms",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: Rooms,
                  showSearchBox: true,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Room(text: 'Room 1'),
                    Room(text: 'Room 2'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 4'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                    Room(text: 'Room 3'),
                  ],
                ),
              )),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddRoom()));
          },
          backgroundColor: const Color.fromARGB(255, 2, 83, 154),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
    );
  }
}
