import 'package:flutter/material.dart';

class GroupsTabSelector extends StatelessWidget {
  const GroupsTabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _tab("All Groups", true),
        const SizedBox(width: 10),
        _tab("My Groups", false),
      ],
    );
  }

  Widget _tab(String title, bool selected) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFEDEBFF)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected
                  ? const Color(0xFF5B4CFF)
                  : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}