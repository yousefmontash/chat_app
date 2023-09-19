import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:new_one/constants.dart';
import 'package:new_one/models/messages_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<MessagesModel> messagesList = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  void sendMessage({required String email, required String message}) {
    messages.add(
      {
        kMessage: message,
        kCreationTime: DateTime.now(),
        "id": email,
      },
    );
  }

  void getMessages() {
    messages
        .orderBy(kCreationTime, descending: true)
        .snapshots()
        .listen((event) {
      messagesList.clear();
      for (int i = 0; i < event.docs.length; i++) {
        messagesList.add(MessagesModel.fromJson(event.docs[i]));
      }
      emit(ChatSucceed());
    });
  }
}
