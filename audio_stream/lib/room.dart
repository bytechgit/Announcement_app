import 'package:audio_stream/editRoom.dart';
import 'package:audio_stream/models/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/user_controller.dart';

class Room extends StatefulWidget {
  final RoomModel room;
  const Room({Key? key, required this.room}) : super(key: key);

  @override
  State<Room> createState() => RoomState();
}

class RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    final uc = Get.find<UserController>();
    return GestureDetector(
      onTap: () {
        Get.to(
            EditRoom(
              room: widget.room,
            ),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 500));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => EditRoom(
        //               room: widget.room,
        //             )));
      },
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          height: 65,
          width: double.infinity,
          child: Column(children: <Widget>[
            //Row(
            // children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.9,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        widget.room.roomId,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            Expanded(child: SizedBox()),
            const Divider(
              thickness: 1,
            ),
          ])),
    );
  }
}
