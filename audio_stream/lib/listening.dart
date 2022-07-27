import 'package:audio_stream/controllers/web_socket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'controllers/navBarControler.dart';
import 'controllers/user_controller.dart';

class Listening extends StatelessWidget {
  const Listening({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uc = Get.find<UserController>();
    final wsc = Get.find<WebSocketController>();
    final navBar = Get.find<NavBarControler>();
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Listening ',
                style: GoogleFonts.ubuntu(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              JumpingDotsProgressIndicator(
                dotSpacing: 1,
                fontSize: 40.0,
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: GestureDetector(
              onTap: () {
                uc.logout();
                wsc.player.stop();
                wsc.listeningStream?.cancel();

                navBar.changeScreen(4);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Log out',
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
