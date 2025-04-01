import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  List<types.Message> _messages = [];
  final _user = types.User(id: '1');
  final _otherUser = types.User(id: '2');

  final String _apiUrl = "http://192.168.1.21:8001/accounts/psychiatrist-chat/";
  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQzNDgyMjkxLCJpYXQiOjE3NDMzOTU4OTEsImp0aSI6IjA0Yjk5YTBlNGFhODQ2NzJhM2EyMjcyZWVhZDQ2NzBlIiwidXNlcl9pZCI6NH0.c9SBr3Djzk36YQdIUF483pIkPNT34tRN28OfXgau6sw";

  void _sendMessage(types.PartialText message) async {
    print("benchat${message.text}.");

    final msg = types.TextMessage(
      id: const Uuid().v4(),
      author: _user,
      text: message.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, msg);
    });

    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode({'message': message.text}),
    );

    if (response.statusCode == 200) {
      print("benchat");
      final responseData = jsonDecode(response.body);
      print("benchat$responseData");
      final replyMsg = types.TextMessage(
        id: const Uuid().v4(),
        author: _otherUser,
        text: responseData['message'],
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      setState(() {
        _messages.insert(0, replyMsg);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button

        backgroundColor: Colors.white38,
        elevation: 0,
        title: Row(
          children: [
            // Circular Avatar
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/utharam-logo.png"), // Correct usage
              radius: 20, // Adjust size as needed
            ),
            SizedBox(width: 10), // Space between avatar and text
            // Chat Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MetroMind Bot",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: Colors.green, size: 28),
            onPressed: () {
              // Add your video call function here
              print("Video call pressed");
            },
          ),
          // Video Call Icon
          // IconButton(
          //   icon: Icon(Icons.videocam, color: Colors.green, size: 28),
          //   onPressed: () {
          //     // Add your video call function here
          //     print("Video call pressed");
          //   },
          // ),
        ],
      ),
      body: Chat(
        showUserAvatars: true,
        // Show user avatars
        showUserNames: true,
        // Show usernames
          inputOptions: InputOptions(
            sendButtonVisibilityMode: SendButtonVisibilityMode.always, // Fix applied
          ),
        messages: _messages,
        onSendPressed: (_){},
        user: _user,
        theme: const DefaultChatTheme(
          primaryColor: Colors.green,
          sentMessageBodyTextStyle: TextStyle(color: Colors.white),
          receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
        ),
        customBottomWidget: _buildCustomInputField(),
        // customMessageBuilder: (message, {required messageWidth}) {
        //   if (message is types.TextMessage) {
        //     // Format time
        //     String formattedTime = DateFormat('hh:mm a').format(
        //       DateTime.fromMillisecondsSinceEpoch(message.createdAt ?? 0),
        //     );
        //
        //     return Container(
        //       padding: EdgeInsets.all(10),
        //       margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        //       decoration: BoxDecoration(
        //         color: message.author.id == _user.id
        //             ? Colors.blue
        //             : Colors.grey[300],
        //         borderRadius: BorderRadius.circular(12),
        //       ),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             "$message",
        //             style: TextStyle(
        //               color: message.author.id == _user.id
        //                   ? Colors.white
        //                   : Colors.black,
        //             ),
        //           ),
        //           SizedBox(height: 5),
        //           Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Text(
        //                 formattedTime, // Show message time
        //                 style: TextStyle(fontSize: 10, color: Colors.white70),
        //               ),
        //               SizedBox(width: 5),
        //               if (message.author.id == _user.id) ...[
        //                 if (message.metadata?['status'] == 'seen')
        //                   Icon(Icons.done_all,
        //                       size: 14, color: Colors.blue) // Seen tick
        //                 else
        //                   Icon(Icons.check, size: 14, color: Colors.white70),
        //                 // Sent tick
        //               ],
        //             ],
        //           ),
        //         ],
        //       ),
        //     );
        //   }
        //   return SizedBox();
        // },
      ),
    );
  }
  Widget _buildCustomInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(

          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            // IconButton(
            //   icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.white54),
            //   onPressed: () {},
            // ),
            SizedBox(width: 10,),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: "Message",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
           /* IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.white54),
              onPressed: () {},
            ),*/
            // IconButton(
            //   icon: const Icon(Icons.currency_rupee, color: Colors.white54),
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: const Icon(Icons.camera_alt_outlined, color: Colors.white54),
            //   onPressed: () {},
            // ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send_sharp, color: Colors.white),
                onPressed: (){
                  if (_messageController.text.trim().isNotEmpty) {
                    _sendMessage(types.PartialText(text: _messageController.text));
                  }              },
              ),
            ),
          ],
        ),
      ),
    );
  }

}

