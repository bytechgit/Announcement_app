import 'package:audio_stream/PlayButton.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

import 'Blob.dart';

class broadcasting extends StatefulWidget {
  const broadcasting({Key? key}) : super(key: key);

  @override
  State<broadcasting> createState() => _broadcastingState();
}

class _broadcastingState extends State<broadcasting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: PlayButton(
                  pauseIcon: Icon(Icons.volume_up_rounded,
                      color: Color.fromARGB(255, 2, 83, 154), size: 90),
                  playIcon: Icon(Icons.volume_off_rounded,
                      color: Color.fromARGB(255, 2, 83, 154), size: 90),
                  onPressed: () {},
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Log out',
                    style: GoogleFonts.ubuntu(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
