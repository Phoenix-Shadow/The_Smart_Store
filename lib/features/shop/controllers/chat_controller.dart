import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For timestamps

class ChatMessage {
  final String text;
  final bool isUser;
  final String timestamp;

  ChatMessage({required this.text, required this.isUser})
      : timestamp = DateFormat('hh:mm a').format(DateTime.now());
}

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;
  TextEditingController messageController = TextEditingController();
  Timer? _debounce;

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isNotEmpty) {
      messages.add(ChatMessage(text: text, isUser: true));
      messageController.clear();

      // Cancel any existing debounce timer
      _debounce?.cancel();

      // Simulate AI response with a delay
      _debounce = Timer(const Duration(seconds: 1), () {
        messages.add(ChatMessage(
          text: "I'm here to assist you!", // Placeholder for Rasa integration
          isUser: false,
        ));
      });
    }
  }

  void clearMessages() {
    messages.clear();
  }

  @override
  void onClose() {
    messageController.dispose();
    _debounce?.cancel();
    super.onClose();
  }
}
