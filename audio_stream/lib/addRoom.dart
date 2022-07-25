import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class addRoom extends StatefulWidget {
  const addRoom({Key? key}) : super(key: key);

  @override
  State<addRoom> createState() => _addRoomState();
}

class _addRoomState extends State<addRoom> {
  @override
  late TextEditingController tagcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'images/roomPhoto.png',
                  height: 300,
                ),
              ),

              // FittedBox(
              //   fit: BoxFit.scaleDown,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
              //     child: Text('New room',
              //         style: GoogleFonts.trirong(
              //           fontSize: 35,
              //         )),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextField(
                        decoration: InputDecoration(
                      labelText: "Room name",
                      floatingLabelStyle:
                          TextStyle(color: Color.fromARGB(255, 2, 83, 154)),
                      prefixIcon: Icon(Icons.edit),
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(fontSize: 17, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 2, 83, 154)),
                      ),
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Color.fromARGB(255, 2, 83, 154),
                        label: const Text(
                          'nesto',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Color.fromARGB(255, 2, 83, 154),
                        label: const Text(
                          'nesto',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Color.fromARGB(255, 2, 83, 154),
                        label: const Text(
                          'nesto',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Color.fromARGB(255, 2, 83, 154),
                        label: const Text(
                          'nesto',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: Color.fromARGB(255, 2, 83, 154),
                        label: const Text(
                          'nesto',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 40),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextField(
                    controller: tagcontroller,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                      suffixIcon: tagcontroller.text.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 2, 83, 154),
                              ),
                              onPressed: () {
                                setState(() {});
                              }),

                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      // border: InputBorder.none,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                      ),

                      hintText: 'Add Tag',
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 2, 83, 154),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Add room',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
