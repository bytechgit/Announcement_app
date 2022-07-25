import 'dart:math';
import 'package:flutter/material.dart';
import 'Blob.dart';

class PlayButton extends StatefulWidget {
  final bool initialIsPlaying;
  final Icon playIcon;
  final Icon pauseIcon;
  final VoidCallback onPressed;

  const PlayButton(
      {Key? key,
      required this.onPressed,
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

    _scaleController =
        AnimationController(vsync: this, duration: _kToggleDuration)
          ..addListener(() => setState(_updateScale));

    super.initState();
  }

  void _onToggle() {
    setState(() => isPlaying = !isPlaying);

    if (_scaleController.isCompleted) {
      _scaleController.reverse();
    } else {
      _scaleController.forward();
    }

    widget.onPressed();
  }

  Widget _buildIcon(bool isPlaying) {
    return SizedBox.expand(
      key: ValueKey<bool>(isPlaying),
      child: IconButton(
        icon: isPlaying ? widget.pauseIcon : widget.playIcon,
        onPressed: _onToggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_showWaves) ...[
            Blob(
                color: const Color(0xff0092ff),
                scale: _scale,
                rotation: _rotation),
            Blob(
                color: const Color(0xff4ac7b7),
                scale: _scale,
                rotation: _rotation * 2 - 30),
            Blob(
                color: const Color(0xffa4a6f6),
                scale: _scale,
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
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}

// class PlayButton extends StatefulWidget {
//   final bool initialIsPlaying;
//   final Icon playIcon;
//   final Icon pauseIcon;
//   final VoidCallback onPressed;

//   PlayButton({
//     required this.onPressed,
//     this.initialIsPlaying = false,
//     this.playIcon = const Icon(Icons.play_arrow),
//     this.pauseIcon = const Icon(Icons.pause),
//   }) : assert(onPressed != null);

//   @override
//   _PlayButtonState createState() => _PlayButtonState();
// }

// class _PlayButtonState extends State<PlayButton> {
//   late bool isPlaying;

//   double _rotation = 0;
//   double _scale = 0.85;

//   @override
//   void initState() {
//     isPlaying = widget.initialIsPlaying;
//     super.initState();
//   }

//   void _onToggle() {
//     setState(() {
//       isPlaying = !isPlaying;
//       _scale = _scale == 1 ? .85 : 1;
//     });
//     widget.onPressed();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(minWidth: 48, minHeight: 48),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Blob(
//             color: Color(0xff0092ff), // color blue
//             scale: _scale,
//             rotation: _rotation,
//           ),
//           Blob(
//             color: Color(0xff4ac7b7), // color green
//             scale: _scale,
//             rotation: _rotation * 2 - 30, // offset angle from _rotation
//           ),
//           Blob(
//             color: Color(0xffa4a6f6), // color purple
//             scale: _scale,
//             rotation: _rotation * 3 - 45, // offset angle from _rotation
//           ),
//           Container(
//             constraints: BoxConstraints.expand(),
//             child: IconButton(
//               icon: isPlaying ? widget.pauseIcon : widget.playIcon,
//               onPressed: _onToggle,
//             ),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
