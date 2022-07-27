import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Blob.dart';
import 'controllers/user_controller.dart';
import 'controllers/web_socket.dart';

class PlayButton extends StatefulWidget {
  final bool initialIsPlaying;
  final Icon playIcon;
  final Icon pauseIcon;
  const PlayButton(
      {Key? key,
      this.initialIsPlaying = false,
      this.playIcon = const Icon(Icons.volume_up),
      this.pauseIcon = const Icon(Icons.volume_down)})
      : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with TickerProviderStateMixin {
  static const _kToggleDuration = Duration(milliseconds: 300);
  static const _kRotationDuration = Duration(seconds: 5);
  final wsc = Get.find<WebSocketController>();
  final uc = Get.find<UserController>();
  late bool isPlaying;

  // rotation and scale animations
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  double _rotation = 0;
  double _scale = 0.85;

  bool get _showWaves => !_scaleController.isDismissed;

  void _updateRotation() => _rotation = _rotationController.value * 2 * pi;
  void _updateScale() => _scale = (_scaleController.value * 0.2) + 0.85;

  @override
  void initState() {
    isPlaying = widget.initialIsPlaying;
    _rotationController =
        AnimationController(vsync: this, duration: _kRotationDuration)
          ..addListener(() => setState(_updateRotation))
          ..repeat();

    // _scaleController =
    //     AnimationController(vsync: this, duration: _kToggleDuration)
    //       ..addListener(() => setState(_updateScale));

    super.initState();
  }

  void _onToggle() {
    if (uc.selectedRoom != null) {
      // setState(() => isPlaying = !isPlaying);

      // if (_scaleController.isCompleted) {
      //   _scaleController.reverse();
      // } else {
      //   _scaleController.forward();
      // }

      ///
      if (!wsc.isRecording.value) {
        wsc.startListening();
      } else {
        wsc.stopListening();
      }
    } else {
      Get.snackbar("Room not selected", "Please select room",
          duration: Duration(seconds: 1));
    }
  }

  Widget _buildIcon(bool isPlaying) {
    return SizedBox.expand(
      key: ValueKey<bool>(isPlaying),
      child: IconButton(
        icon: wsc.isRecording.value ? widget.pauseIcon : widget.playIcon,
        onPressed: _onToggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      child: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            if (wsc.isRecording.value) ...[
              Blob(
                  color: const Color(0xff0092ff),
                  scale: 1.02,
                  rotation: _rotation),
              Blob(
                  color: const Color(0xff4ac7b7),
                  scale: 1.02,
                  rotation: _rotation * 2 - 30),
              Blob(
                  color: const Color(0xffa4a6f6),
                  scale: 1.02,
                  rotation: _rotation * 3 - 45),
            ],
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: AnimatedSwitcher(
                duration: _kToggleDuration,
                child: _buildIcon(isPlaying),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}
