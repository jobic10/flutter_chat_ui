import 'package:chat_ui/data/faker.dart';
import 'package:chat_ui/models/message.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            itemBuilder: (context, index) {
              final Message chat = chats[index];
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFEFEE),
                ),
                margin: EdgeInsets.only(top: 5, bottom: 5, right: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(chat.sender.imageUrl),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat.sender.name,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                chat.text,
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          chat.time,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'NEW',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: chats.length,
          ),
        ),
      ),
    );
  }
}
