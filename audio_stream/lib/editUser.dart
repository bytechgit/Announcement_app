import 'package:audio_stream/controllers/navBarControler.dart';
import 'package:audio_stream/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/user_controller.dart';
import 'models/roomModel.dart';

class EditUser extends StatefulWidget {
  final UserModel user;
  const EditUser({Key? key, required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController tagcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
    passwordcontroller.text = widget.user.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uc = Get.find<UserController>();
    final navBar = Get.find<NavBarControler>();
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text('Update user',
                    style: GoogleFonts.ubuntu(
                      fontSize: 35,
                    )),
              ),
            ),
            Image.asset(
              'images/addUser.png',
              width: MediaQuery.of(context).size.width * 0.85,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Form(
                  key: formkey,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: widget.user.username,
                              floatingLabelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 2, 83, 154)),
                              prefixIcon: const Icon(Icons.people),
                              hintStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              labelStyle: const TextStyle(
                                  fontSize: 17, color: Colors.grey),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 2, 83, 154)),
                              ), //label style
                            )),
                      ),
                      SizedBox(
                          height: 50,
                          child: TextField(
                              controller: passwordcontroller,
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
                              ))),
                    ],
                  ))),
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("admin"),
              value: widget.user.admin,
              onChanged: (newValue) {
                setState(() {
                  widget.user.admin = newValue ?? false;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Wrap(
                children: widget.user.rooms
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
                              widget.user.rooms.remove(e);
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
                                  widget.user.rooms.add(tagcontroller.text);
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
                    onPressed: () {
                      widget.user.password = passwordcontroller.text;
                      uc.updateUser(u: widget.user);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 2, 83, 154),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Update user',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ),
            Text(
              'or',
              style: GoogleFonts.ubuntu(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      final result =
                          await uc.deleteUser(username: widget.user.username);
                      if (result) {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 2, 83, 154),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Delete user',
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
