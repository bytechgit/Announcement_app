import 'dart:typed_data';

import 'package:flutter/material.dart';

class Message {
  String roomId;
  String data;
  //Uint8List data;
  Message({required this.roomId, required this.data});
  Map<String, dynamic> toJson() => {
        'roomId': roomId,
        'data': data,
      };
}
