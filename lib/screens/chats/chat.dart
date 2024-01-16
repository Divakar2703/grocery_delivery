import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_side/screens/chats/shop_details.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class Message {
  final String text;
  final DateTime date;
  final bool isSendByMe;

  Message({
    required this.text,
    required this.date,
    required this.isSendByMe,
  });
}

class _ChatState extends State<Chat> {
  List<Message> messages = [
    // Your message data here
  ];

  TextEditingController _textEditingController = TextEditingController();

  final DateFormat dateFormat = DateFormat.yMMMd();





  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Change this color to the desired color
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage( "assets/images/Profile Image.png",), //
            ),
            SizedBox(
              width: 10,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No Users",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  "Select",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
        Spacer(),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/receipt.svg', // Replace with your SVG file path
            width: 18.0,
            height: 18.0,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              enableDrag: false,
              builder: (_) => ShopDetails(),
            );
            // Add yo
          },
        ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32)
                )

              ),
              height: 75,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'Type your message here....',
                        helperStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0), // Set border radius here
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(20.0), // Set border radius here
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(20.0), // Set border radius here
                        ),
                      ),
                    )

                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      final newMessage = Message(
                        text: _textEditingController.text,
                        date: DateTime.now(),
                        isSendByMe: true,
                      );
                      setState(() {
                        messages.add(newMessage);
                      });
                      _textEditingController.clear();
                    },
                    icon: Icon(
                      Icons.attachment_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final newMessage = Message(
                        text: _textEditingController.text,
                        date: DateTime.now(),
                        isSendByMe: true,
                      );
                      setState(() {
                        messages.add(newMessage);
                      });
                      _textEditingController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}