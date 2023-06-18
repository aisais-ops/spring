import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: const Color(0xffe4cdaa),
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to',
            style: TextStyle(color: Color(0xff906520)),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            'images/logo.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'family',
            style: TextStyle(color: Color(0xff906520)),
          ),
        ],
      ),
    );
  }
}
