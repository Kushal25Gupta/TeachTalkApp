import 'package:flutter/material.dart';

import '../../Colors/App_Colors.dart';
import '../Images/network_image.dart';

class CustomAppBar {

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  AppBar customAppBar(String imageUrl){
    return AppBar(
      elevation: 0,
      leadingWidth: 60,
      centerTitle: false,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CircleAvatar(
          backgroundColor: AppColor.customOrangeColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CustomNetworkImage(url: imageUrl),
          ),
        ),
      ),
      title: Text(
        _getGreetingMessage(),
        style: const TextStyle(
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.bold,
          color: AppColor.customPurpleColor,
        ),
      ),
    );
  }

}
