import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart'; // Assuming you have a colors file

class AICHatScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      _messages.add({'sender': 'user', 'text': message});
      _textController.clear();
      _messages.add({'sender': 'assistant', 'text': 'Thank you for your message! How can I assist you?'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryBackground, // Use one of your existing colors
      appBar: AppBar(
        title: Text('AI Shopping Assistant'),
        backgroundColor: MColors.light,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment: msg['sender'] == 'user' ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: msg['sender'] == 'user' ? Colors.white : MColors.lightContainer,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      msg['text'] ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => sendMessage(_textController.text),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: MColors.primaryBackground,
                  ),
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}