import 'package:audio_stream/models/roomModel.dart';
import 'package:audio_stream/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/user_controller.dart';

class EditRoom extends StatefulWidget {
  final RoomModel room;
  const EditRoom({Key? key, required this.room}) : super(key: key);

  @override
  State<EditRoom> createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {
  late TextEditingController tagcontroller = TextEditingController();
  @override
  void initState() {
    widget.room.loadUsers().then((value) {
      setState(() {});
    });
    super.initState();
  }

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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'images/roomPhoto.png',
                    width: MediaQuery.of(context).size.width * 0.85,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
                  child: SizedBox(
                      height: 50,
                      // padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: widget.room.roomId,
                            floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 2, 83, 154)),
                            prefixIcon: const Icon(Icons.edit),
                            hintStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            labelStyle: const TextStyle(
                                fontSize: 17, color: Colors.grey),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 2, 83, 154)),
                            ),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Wrap(
                    children: widget.room.users
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
                                  widget.room.users.remove(e);
                                  uc.removeUserFromRoom(
                                      roomId: widget.room.roomId,
                                      username: e,
                                      user: true);
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
                                      widget.room.users.add(tagcontroller.text);
                                      uc.addUserToRoom(
                                          roomId: widget.room.roomId,
                                          username: tagcontroller.text,
                                          user: false);
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          final result =
                              await uc.deleteRoom(roomId: widget.room.roomId);
                          if (result) {
                            Get.back();
                            // Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 2, 83, 154),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Delete room',
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
