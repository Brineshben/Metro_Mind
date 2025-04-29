import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:patient/utils/Api_Constants.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/Constants.dart';
import '../../../utils/color_util.dart';


class ChatScreen extends StatefulWidget {
  final String patientToken;
  const ChatScreen({super.key, required this.patientToken});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  List<types.Message> _messages = [];
  final _user = types.User(id: '1');
  final _otherUser = types.User(
    id: '2',
    firstName: 'MetroMind AI',
  );
  final String _apiUrl = ApiConstants.chat;

  String? sessionId; // Store session ID across messages

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

    // Prepare request body with optional session_id
    Map<String, dynamic> requestBody = {
      'message': message.text,
    };

    if (sessionId != null && sessionId!.isNotEmpty) {
      requestBody['session_id'] = sessionId;
    }

    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.patientToken}',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));
      print("benchat$responseData");

      // Update sessionId
      sessionId = responseData['session_id'];

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleDark,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 130.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 0.2, color: Colorutils.userdetailcolor),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade50, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 0.1,
                    spreadRadius: 0.1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 12.w),
                        SizedBox(width: 12.w),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.r,
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/utharam-logo.png",
                                fit: BoxFit.cover,
                                width: 54.r,
                                height: 54.r,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MetroMind Bot',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.h,
                                  color: Colors.black.withOpacity(0.9),
                                ),
                              ),
                              Text(
                                'online',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.h,
                                  color: Colorutils.userdetailcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // IconButton(
                        //   icon: Icon(Icons.call,
                        //       color: Colorutils.userdetailcolor, size: 28),
                        //   onPressed: () {},
                        // ),
                        SizedBox(width: 12.w),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Chat(
                
                showUserAvatars: true,
                showUserNames: true,
                inputOptions: InputOptions(
                  sendButtonVisibilityMode: SendButtonVisibilityMode.always,
                ),
                messages: _messages,
                onSendPressed: (_) {}, // No default handler needed
                user: _user,
                theme: const DefaultChatTheme(
                  primaryColor: Colorutils.userdetailcolor,
                  sentMessageBodyTextStyle: TextStyle(color: Colors.white),
                  receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
                ),
                customBottomWidget: _buildCustomInputField(),
                emptyState: Center(child: Text("hjhjdidijije")),
                avatarBuilder: _customAvatarBuilder,

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
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
            Container(
              decoration: const BoxDecoration(
                color: Colorutils.userdetailcolor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send_sharp, color: Colors.white),
                onPressed: () {
                  if (_messageController.text.trim().isNotEmpty) {
                    _sendMessage(
                        types.PartialText(text: _messageController.text));
                    _messageController.clear();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget _customAvatarBuilder(types.User user) {
  if (user.id == '2') {
    // Bot user (received message)
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/images/utharam-logo.png'),
      ),
    );
  } else {
    // Normal user (you can put user's image or initials here)
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: Text(
        user.firstName?.substring(0, 1).toUpperCase() ?? 'U',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}