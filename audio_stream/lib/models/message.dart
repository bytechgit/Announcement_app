import 'dart:typed_data';

class Message {
  String roomId;
  List<int> data;
  //Uint8List data;
  Message({required this.roomId, required this.data});
  Map<String, dynamic> toJson() => {
        'roomId': roomId,
        'data': data,
      };
}
