import 'package:audio_stream/models/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';

import 'PlayButton.dart';
import 'controllers/user_controller.dart';

class Speaking extends StatefulWidget {
  const Speaking({Key? key}) : super(key: key);

  @override
  State<Speaking> createState() => _SpeakingState();
}

class _SpeakingState extends State<Speaking> {
  //final TextEditingController _controller = TextEditingController();
  final uc = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: SizedBox(
            child: Obx(
              () => DropdownSearch<String>(
                //compareFn: (i1, i2) => i1.roomId== i2.roomId,
                items: uc.rooms.value.map((e) => e.roomId).toList(),
                selectedItem: "choose a room",
                popupProps: const PopupProps.modalBottomSheet(
                  showSearchBox: true,
                  fit: FlexFit.tight,
                ),
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
        Center(
          child: SizedBox(
              height: 200,
              width: 200,
              child: PlayButton(
                pauseIcon: const Icon(Icons.mic_rounded,
                    color: Color.fromARGB(255, 2, 83, 154), size: 90),
                playIcon: const Icon(Icons.mic_off_rounded,
                    color: Color.fromARGB(255, 2, 83, 154), size: 90),
                onPressed: () {},
              )
              // ),
              ),
        ),
        // Icon(
        //   Icons.mic,
        //   size: 150,
        // ),
        Expanded(child: Container())
      ],
    ));
  }
}
