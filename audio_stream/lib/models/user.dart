import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../changeUser.dart';

class user extends StatefulWidget {
  String text;
  user({Key? key, required this.text}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => changeUser()));
      },
      child: Container(
          decoration: BoxDecoration(
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
                      backgroundColor: Color.fromARGB(255, 2, 83, 154),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        widget.text,
                        style: GoogleFonts.ubuntu(
                            fontSize: 19, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
          ])),
    );
  }
}
