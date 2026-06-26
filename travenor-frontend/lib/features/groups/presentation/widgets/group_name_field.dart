import 'package:flutter/material.dart';

class GroupNameField extends StatelessWidget {
  final TextEditingController controller;

  const GroupNameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Group Name',
        prefixIcon: const Icon(Icons.groups),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}