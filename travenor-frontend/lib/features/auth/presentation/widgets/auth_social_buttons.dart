import 'package:flutter/material.dart';

class AuthSocialButtons extends StatelessWidget {
  const AuthSocialButtons({super.key});

  Widget buildCircle(IconData icon) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          child: Icon(Icons.facebook, size: 30),
        ),
        SizedBox(width: 20),
        CircleAvatar(
          radius: 25,
          child: Icon(Icons.camera_alt),
        ),
        SizedBox(width: 20),
        CircleAvatar(
          radius: 25,
          child: Icon(Icons.flutter_dash),
        ),
      ],
    );
  }
}