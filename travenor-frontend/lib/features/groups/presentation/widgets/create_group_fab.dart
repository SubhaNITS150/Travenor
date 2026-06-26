import 'package:flutter/material.dart';
import 'package:travenor/features/groups/data/groups_service.dart';
import 'package:travenor/features/groups/presentation/screens/create_group_dialog.dart';

class CreateGroupFab extends StatelessWidget {
  const CreateGroupFab({super.key});

  @override
  Widget build(BuildContext context) {
    final groupService = GroupService();

    return FloatingActionButton(
      backgroundColor: const Color(0xFF5B4CFF),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => CreateGroupDialog(
            onCreate: (
              String groupName,
              List<String> emails,
            ) async {
              try {
                await groupService.createGroup(
                  groupName: groupName,
                  memberEmails: emails,
                );

                if (!context.mounted) return;

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Group created successfully',
                    ),
                  ),
                );
              } catch (e) {
                if (!context.mounted) return;

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      e.toString(),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}