import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static String id = 'HomeScreen';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    var messageController = TextEditingController();
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('date', descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          // scrollController = ScrollController(
          //     initialScrollOffset: messages.id.length.toDouble());
          // print(messages.);
          print(snapshot.data!.docs.length);
          List<MessageModel> messageList = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(kLogo, scale: 2),
                  const Text('Chat'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return messageList[index].id == email
                            ? ChatBubble(messageList[index].body,
                                color: kPrimaryColor,
                                align: AlignmentDirectional.centerStart)
                            : ChatBubble(messageList[index].body,
                                color: Colors.blueAccent,
                                align: AlignmentDirectional.centerEnd);
                      },
                      itemCount: messageList.length),
                )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: messageController,
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        messages.add({
                          'body': messageController.text,
                          'date': DateTime.now(),
                          'id': email,
                        });
                        messageController.clear();
                        scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                        print(scrollController.position.maxScrollExtent);
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Send message',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            if (messageController.text.isNotEmpty) {
                              messages.add({
                                'body': messageController.text,
                                'date': DateTime.now(),
                                'id': email,
                              });
                              messageController.clear();
                              scrollController.animateTo(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              );
                            }
                          },
                        )),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Align ChatBubble(message,
      {required Color color, required AlignmentGeometry align}) {
    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: align == AlignmentDirectional.centerStart
              ? BorderRadius.circular(25)
                  .copyWith(bottomLeft: const Radius.circular(0))
              : BorderRadius.circular(25)
                  .copyWith(bottomRight: const Radius.circular(0)),
          color: color,
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
