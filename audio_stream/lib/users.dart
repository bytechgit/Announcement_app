import 'package:audio_stream/addUser.dart';
import 'package:audio_stream/models/user.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class users extends StatefulWidget {
  const users({Key? key}) : super(key: key);

  @override
  State<users> createState() => _usersState();
}

List Users = [
  'marija',
  'nikola',
  'sasa',
  'nadja',
  'zika',
  'pera',
  'bla',
  'bla'
];

class _usersState extends State<users> {
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
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: DropdownSearch(
                  dropdownSearchBaseStyle: GoogleFonts.ubuntu(),
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Users",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: Users,
                  showSearchBox: true,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      user(text: 'marija'),
                      user(text: 'nikola'),
                      user(text: 'sasa'),
                      user(text: 'nadja'),
                      user(text: 'marija'),
                      user(text: 'marija'),
                      user(text: 'marija'),
                      user(text: 'marija'),
                      user(text: 'marija'),
                      user(text: 'marija'),
                      user(text: 'marija'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const addUser()));
          },
          backgroundColor: Color.fromARGB(255, 2, 83, 154),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
    );
  }
}
