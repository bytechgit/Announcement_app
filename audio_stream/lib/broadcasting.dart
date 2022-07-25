import 'package:audio_stream/PlayButton.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Broadcasting extends StatefulWidget {
  const Broadcasting({Key? key}) : super(key: key);

  @override
  State<Broadcasting> createState() => _BroadcastingState();
}

class _BroadcastingState extends State<Broadcasting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
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
                  pauseIcon: const Icon(Icons.volume_up_rounded,
                      color: Color.fromARGB(255, 2, 83, 154), size: 90),
                  playIcon: const Icon(Icons.volume_off_rounded,
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
