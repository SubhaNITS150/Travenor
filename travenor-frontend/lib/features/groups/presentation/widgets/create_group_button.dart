import 'package:flutter/material.dart';

class CreateGroupButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateGroupButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.groups),
        label: const Text('Create Group'),
      ),
    );
  }
}