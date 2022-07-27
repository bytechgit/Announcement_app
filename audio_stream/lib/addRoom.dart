import 'package:audio_stream/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/user_controller.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({Key? key}) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController tagcontroller = TextEditingController();
  TextEditingController roomnamecontroller = TextEditingController();
  List<String> users = [];
  @override
  Widget build(BuildContext context) {
    final uc = Get.find<UserController>();
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                  child: SizedBox(
                      height: 80,
                      child: Form(
                        key: formkey,
                        child: TextFormField(
                            validator:
                                RequiredValidator(errorText: "Enter password"),
                            controller: roomnamecontroller,
                            decoration: const InputDecoration(
                              labelText: "Room name",
                              floatingLabelStyle: TextStyle(
                                  color: Color.fromARGB(255, 2, 83, 154)),
                              prefixIcon: Icon(Icons.edit),
                              hintStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              labelStyle:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 2, 83, 154)),
                              ),
                            )),
                      )),
                ),
                Wrap(
                  children: users
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
                                users.remove(e);
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 40),
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
                                    if (uc.users.value
                                            .firstWhere(
                                                (element) =>
                                                    element.username ==
                                                    tagcontroller.text,
                                                orElse: () => UserModel(
                                                    username: "",
                                                    password: "",
                                                    admin: false,
                                                    rooms: []))
                                            .username ==
                                        tagcontroller.text) {
                                      users.add(tagcontroller.text);
                                    } else {
                                      Get.snackbar("Error", "User not found");
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
                        onPressed: () async {
                          if (formkey.currentState?.validate() == true) {
                            final result = await uc.addRoom(
                                roomId: roomnamecontroller.text, users: users);
                            if (result) {
                              setState(() {
                                roomnamecontroller.text = "";
                                users.clear();
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
