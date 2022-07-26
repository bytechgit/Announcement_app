import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:audio_stream/controllers/user_controller.dart';
import 'package:audio_stream/models/message.dart';
import 'package:get/get.dart';
import 'package:sound_stream/sound_stream.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketController extends GetxController {
  final uc = Get.find<UserController>();
  String id = '';
  late IOWebSocketChannel channel;
  WebSocketController() {
    player.initialize();
    player.status.listen((status) {
      isPlaying.value = status == SoundStreamStatus.Playing;
    });

    recorder.initialize();
    recorder.status.listen((status) {
      isRecording.value = status == SoundStreamStatus.Playing;
    });

    recorder.audioStream.listen((data) {
      channel.sink.add(
          jsonEncode(Message(roomId: uc.selectedRoom!, data: data).toJson()));
      print(jsonEncode(Message(roomId: uc.selectedRoom!, data: data).toJson()));
    });
  }
//42
  void listen() {
    channel = IOWebSocketChannel.connect(
        'ws://vargapp-env.eba-is6gvbmw.us-east-1.elasticbeanstalk.com/websockets?${uc.user.value!.rooms.join('-,-')}',
        pingInterval: const Duration(seconds: 5));
    channel.stream.listen((message) {
      player.writeChunk(Uint8List.fromList(message.cast<int>().toList()));
    }, onDone: (() async {
      print('reconnect ');
      await Future.delayed(const Duration(seconds: 1));
      listen();
    }), onError: ((e) async {
      await Future.delayed(const Duration(seconds: 1));
      listen();
    }));
  }

  final RecorderStream recorder = RecorderStream();
  final isRecording = false.obs;

  final PlayerStream player = PlayerStream();
  final isPlaying = false.obs;

  final List<Uint8List> _micChunks = [];
  void play() async {
    await player.start();

    if (_micChunks.isNotEmpty) {
      for (var chunk in _micChunks) {
        await player.writeChunk(chunk);
      }
      _micChunks.clear();
    }
  }
}
