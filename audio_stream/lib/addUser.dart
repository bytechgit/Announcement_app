import 'package:audio_stream/models/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/user_controller.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<String> rooms = [];
  TextEditingController tagcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool admin = false;
  @override
  Widget build(BuildContext context) {
    final uc = Get.find<UserController>();
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('New user',
                      style: GoogleFonts.ubuntu(
                        fontSize: 35,
                      )),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'images/addUser.png',
                width: MediaQuery.of(context).size.width * 0.85,
              ),
            ),
            // Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Form(
                  key: formkey,
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                            controller: usernamecontroller,
                            validator:
                                RequiredValidator(errorText: "Enter username"),
                            decoration: const InputDecoration(
                              labelText: "Username",
                              floatingLabelStyle: TextStyle(
                                  color: Color.fromARGB(255, 2, 83, 154)),
                              prefixIcon: Icon(Icons.people),
                              hintStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              labelStyle:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 2, 83, 154)),
                              ), //label style
                            )),
                      ),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          controller: passwordcontroller,
                          validator:
                              RequiredValidator(errorText: "Enter password"),
                          decoration: const InputDecoration(
                            labelText: "Password",
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 2, 83, 154)),
                            prefixIcon: Icon(Icons.lock),
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            labelStyle:
                                TextStyle(fontSize: 17, color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 2, 83, 154)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("admin"),
              value: admin,
              onChanged: (newValue) {
                setState(() {
                  admin = newValue ?? false;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Wrap(
                children: rooms
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          backgroundColor:
                              const Color.fromARGB(255, 2, 83, 154),
                          labelStyle: const TextStyle(color: Colors.white),
                          deleteIcon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                          onDeleted: () {
                            setState(() {
                              rooms.remove(e);
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
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
                                if (uc.rooms.value
                                        .firstWhere(
                                            (element) =>
                                                element.roomId ==
                                                tagcontroller.text,
                                            orElse: () => RoomModel(
                                                roomId: "", users: []))
                                        .roomId ==
                                    tagcontroller.text) {
                                  rooms.add(tagcontroller.text);
                                } else {
                                  Get.snackbar("Error", "Room not found");
                                }
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

                    hintText: 'Add Room',
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
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formkey.currentState?.validate() == true) {
                        final result = await uc.addUser(
                            username: usernamecontroller.text,
                            password: passwordcontroller.text,
                            admin: true,
                            rooms: rooms);
                        if (result) {
                          setState(() {
                            usernamecontroller.text = "";
                            passwordcontroller.text = "";
                            admin = false;
                            rooms.clear();
                          });
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 2, 83, 154),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Add user',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
