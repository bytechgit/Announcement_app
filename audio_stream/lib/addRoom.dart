import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({Key? key}) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  TextEditingController tagcontroller = TextEditingController();
  final lista = [
    'aaaaaa',
    'bbbbb',
    'bbbbb',
    'bbbbb',
    'bbbbb',
    'bbbbb',
    'bbbbb',
    'bbbbb'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset('images/roomPhoto.png',
                        width: MediaQuery.of(context).size.width * 0.85),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 30),
                  child: SizedBox(
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                        labelText: "Room name",
                        floatingLabelStyle:
                            TextStyle(color: Color.fromARGB(255, 2, 83, 154)),
                        prefixIcon: Icon(Icons.edit),
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(fontSize: 17, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 2, 83, 154)),
                        ),
                      ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Wrap(
                    children: lista
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Chip(
                              backgroundColor: Color.fromARGB(255, 2, 83, 154),
                              labelStyle: TextStyle(color: Colors.white),
                              deleteIcon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                              onDeleted: () {
                                setState(() {
                                  lista.remove(e);
                                });
                              },
                              label: Text(
                                e,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                  child: SizedBox(
                    width: double.infinity,
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
                                  setState(() {
                                    lista.add(tagcontroller.text);
                                    tagcontroller.text = '';
                                  });
                                }),

                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.all(15),
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0,
                            style: BorderStyle.solid,
                          ),
                        ),

                        hintText: 'Add User',
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
                    width: double.infinity,
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
      ),
    );
  }
}
