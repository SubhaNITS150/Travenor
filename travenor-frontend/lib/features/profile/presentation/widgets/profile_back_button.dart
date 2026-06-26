import 'package:flutter/material.dart';

class ProfileBackButton extends StatelessWidget {
  const ProfileBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 10,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          elevation: 2,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF2196F3),
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}