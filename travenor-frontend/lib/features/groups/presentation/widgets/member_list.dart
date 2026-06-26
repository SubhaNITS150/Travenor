import 'package:flutter/material.dart';
import 'member_tile.dart';

class MemberList extends StatelessWidget {
  final List<String> emails;
  final Function(int) onDelete;

  const MemberList({
    super.key,
    required this.emails,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (emails.isEmpty) {
      return const Center(
        child: Text('No members added'),
      );
    }

    return ListView.separated(
      itemCount: emails.length,

      separatorBuilder: (_, __) =>
          const SizedBox(height: 10),

      itemBuilder: (_, index) {
        return MemberTile(
          email: emails[index],
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}