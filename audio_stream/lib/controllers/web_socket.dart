//import 'dart:async';

import 'dart:convert';

import 'package:audio_stream/models/message.dart';
import 'package:web_socket_channel/io.dart';
//import 'package:web_socket_channel/status.dart' as status;

class WebSocketController {
  String roomId = '';
  final channel = IOWebSocketChannel.connect('ws://100.110.169.48:3000/sasa');
  WebSocketController() {
    // Timer.periodic(Duration(seconds: 2), (timer) {
    //   send(timer.tick.toString());
    // });
    listen();
  }
  void listen() {
    channel.stream.listen((message) {
      print(message);
      //channel.sink.close(status.goingAway);
    }, onDone: (() {
      print('reconnect ');
    }), onError: ((e) {}));
  }

  void send(Message m) {
    channel.sink.add(jsonEncode(m.toJson()));
  }
}
