import 'package:audio_stream/editRoom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Room extends StatefulWidget {
  final String text;
  const Room({Key? key, required this.text}) : super(key: key);

  @override
  State<Room> createState() => RoomState();
}

class RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: GestureDetector(
          onTap: () {},
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EditRoom()));
                            },
                            child: Text(
                              widget.text,
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.grey[600],
                          )),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
              ])),
        ));
  }
}
