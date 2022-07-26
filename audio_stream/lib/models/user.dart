import 'package:audio_stream/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../editUser.dart';

class User extends StatefulWidget {
  final UserModel user;
  const User({Key? key, required this.user}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditUser(
                      user: widget.user,
                    )));
      },
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          height: 70,
          width: double.infinity,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: const Color.fromARGB(255, 2, 83, 154),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "M",
                            style: GoogleFonts.ubuntu(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        widget.user.username,
                        style: GoogleFonts.ubuntu(
                            fontSize: 19, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
          ])),
    );
  }
}
