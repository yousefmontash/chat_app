import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:new_one/components/chat_bubble.dart';
import 'package:new_one/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_one/pages/cubits/chat_cubit/chat_cubit.dart';

import '../models/messages_model.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  static String id = "ChatPage";
  String? messageContent;
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();
 
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            Text(
              "Chat",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubble(message: messagesList[index])
                        : ChatBubbleForFriend(message: messagesList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                messageContent = value;
              },
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(email: email, message: value);
                controller.clear();
                _controller.animateTo(0,
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn);
              },
              decoration: InputDecoration(
                hintText: "Send Message",
                suffixIcon: IconButton(
                  color: kPrimaryColor,
                  onPressed: () {
                    BlocProvider.of<ChatCubit>(context)
                        .sendMessage(email: email, message: messageContent!);
                    controller.clear();
                    _controller.animateTo(0,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn);
                  },
                  icon: Icon(Icons.send),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
