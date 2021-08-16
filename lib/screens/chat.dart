import 'package:chat_ui/data/faker.dart';
import 'package:chat_ui/models/message.dart';
import 'package:chat_ui/models/user.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 15),
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                  itemCount: messages.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * .75,
      margin: isMe
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )
            : BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
      ),
    );
    if (isMe) return msg;

    return Row(
      children: [
        msg,
        IconButton(
          icon: Icon(
            message.isLiked ? Icons.favorite : Icons.favorite_border,
            color: message.isLiked
                ? Theme.of(context).primaryColor
                : Colors.blueGrey,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
