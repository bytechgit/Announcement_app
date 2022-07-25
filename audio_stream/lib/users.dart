import 'package:audio_stream/addUser.dart';
import 'package:audio_stream/models/user.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

List users1 = [
  'marija',
  'nikola',
  'sasa',
  'nadja',
  'zika',
  'pera',
  'bla',
  'bla'
];

class _UsersState extends State<Users> {
  @override
  //final TextEditingController controller = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  items: users1,
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
                    children: const [
                      User(text: 'marija'),
                      User(text: 'nikola'),
                      User(text: 'sasa'),
                      User(text: 'nadja'),
                      User(text: 'marija'),
                      User(text: 'marija'),
                      User(text: 'marija'),
                      User(text: 'marija'),
                      User(text: 'marija'),
                      User(text: 'marija'),
                      User(text: 'marija'),
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
                MaterialPageRoute(builder: (context) => const AddUser()));
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
