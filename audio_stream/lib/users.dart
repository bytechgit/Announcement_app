import 'package:audio_stream/addUser.dart';
import 'package:audio_stream/models/user.dart';
import 'package:audio_stream/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_listview/resources/arrays.dart';
import 'package:searchable_listview/searchable_listview.dart';

import 'controllers/user_controller.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final uc = Get.find<UserController>();
  @override
  //final TextEditingController controller = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Obx(
                  () => SearchableList<UserModel>(
                    searchTextPosition: SearchTextPosition.top,
                    initialList: uc.users.value,
                    builder: (UserModel user) => User(user: user),
                    filter: (value) => uc.users.value
                        .where(
                          (element) =>
                              element.username.toLowerCase().contains(value),
                        )
                        .toList(),
                    //emptyWidget: Container(),
                    inputDecoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: "Search User",
                      fillColor: Colors.white,
                      isDense: true,
                      constraints: BoxConstraints.tightFor(
                        width: MediaQuery.of(context).size.width * 0.95,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
