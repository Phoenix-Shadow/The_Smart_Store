import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:the_smart_store_user/features/ai_assistant/views/ai_chat_screen.dart';
class AIMessageIcon extends StatelessWidget {
  const AIMessageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Iconsax.message, color: Colors.black, size: 30),
      onPressed: () {
        Get.to(() => AICHatScreen(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 300));
      },
    );
  }
}