import 'package:new_one/constants.dart';

class MessagesModel {
  final String message;
  final String id;
  MessagesModel(
    this.message, this.id,
  );

  factory MessagesModel.fromJson(dynamic data) {
    return MessagesModel(data[kMessage], data["id"]);
  }
}
