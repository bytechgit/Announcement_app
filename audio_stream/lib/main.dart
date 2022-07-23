import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:audio_stream/controllers/web_socket.dart';
import 'package:audio_stream/models/message.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:sound_stream/sound_stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final RecorderStream _recorder = RecorderStream();
  final PlayerStream _player = PlayerStream();

  final List<Uint8List> _micChunks = [];
  bool _isRecording = false;
  bool _isPlaying = false;

  StreamSubscription? _recorderStatus;
  StreamSubscription? _playerStatus;
  StreamSubscription? _audioStream;

  @override
  void initState() {
    super.initState();
    initPlugin();
    // socketIO();
  }

  @override
  void dispose() {
    _recorderStatus?.cancel();
    _playerStatus?.cancel();
    _audioStream?.cancel();
    super.dispose();
  }

//  late IO.Socket socket;
  WebSocketController m = WebSocketController();
  // void socketIO() {
  //   socket = IO.io(
  //       "http://vargapp-env.eba-is6gvbmw.us-east-1.elasticbeanstalk.com/",
  //       <String, dynamic>{
  //         "transports": ["websocket"],
  //         "autoConnect": true,
  //       });

  //   socket.on('connect', (data) {
  //     print("SOCKET_IO_CONNECTED: " + socket.connected.toString());
  //     socket.emit("message", "poruka");
  //   });
  var pom;
  //socket.on('recieveAudio1', (data) {
  //  pom = data.cast<int>().toList();
  //  _player.writeChunk(Uint8List.fromList(pom));
  // });
  // }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    _recorderStatus = _recorder.status.listen((status) {
      if (mounted) {
        setState(() {
          _isRecording = status == SoundStreamStatus.Playing;
        });
      }
    });

    _audioStream = _recorder.audioStream.listen((data) {
      // if (_isPlaying) {
      //   _player.writeChunk(data);
      // } else {
      //   _micChunks.add(data);
      // }

      // socket.emit("sendAudio1", data);
    });

    _playerStatus = _player.status.listen((status) {
      if (mounted) {
        setState(() {
          _isPlaying = status == SoundStreamStatus.Playing;
        });
      }
    });

    await Future.wait([
      _recorder.initialize(),
      _player.initialize(),
    ]);
  }

  void _play() async {
    await _player.start();

    if (_micChunks.isNotEmpty) {
      for (var chunk in _micChunks) {
        await _player.writeChunk(chunk);
      }
      _micChunks.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 96.0,
              icon: Icon(_isRecording ? Icons.mic_off : Icons.mic),
              onPressed: _isRecording ? _recorder.stop : _recorder.start,
            ),
            IconButton(
                iconSize: 96.0,
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  m.send(Message(roomId: '/sasa', data: 'podaci'));
                } //_isPlaying ? _player.stop : _play,
                ),
          ],
        ),
      ),
    );
  }
}
