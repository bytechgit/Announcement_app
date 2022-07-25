import 'package:audio_stream/models/roomModel.dart';
import 'package:audio_stream/room.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_listview/resources/arrays.dart';
import 'package:searchable_listview/searchable_listview.dart';

import 'addRoom.dart';
import 'controllers/user_controller.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

List<Room> rooms = [
  const Room(text: 'Room 1'),
  const Room(text: 'Room 2'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 4'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
  const Room(text: 'Room 3'),
];

class _RoomsState extends State<Rooms> {
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
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: SizedBox(
                  child: SearchableList<RoomModel>(
                    searchTextPosition: SearchTextPosition.top,
                    initialList: uc.rooms.value,
                    builder: (RoomModel room) => Room(text: room.roomId),
                    filter: (value) => uc.rooms.value
                        .where(
                          (element) =>
                              element.roomId.toLowerCase().contains(value),
                        )
                        .toList(),
                    //emptyWidget: Container(),
                    inputDecoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: "Search Rooms",
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
          heroTag: "btn1",
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
