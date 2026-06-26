import 'package:flutter/material.dart';
import 'package:travenor/features/groups/presentation/widgets/create_group_button.dart';
import 'package:travenor/features/groups/presentation/widgets/group_name_field.dart';
import 'package:travenor/features/groups/presentation/widgets/member_email_input.dart';
import 'package:travenor/features/groups/presentation/widgets/member_list.dart';

class CreateGroupDialog extends StatefulWidget {
  final Future<void> Function(String groupName, List<String> memberEmails)
  onCreate;

  const CreateGroupDialog({super.key, required this.onCreate});

  @override
  State<CreateGroupDialog> createState() => _CreateGroupDialogState();
}

class _CreateGroupDialogState extends State<CreateGroupDialog> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final List<String> _memberEmails = [];

  @override
  void dispose() {
    _groupNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _addMember() {
    final email = _emailController.text.trim();

    if (email.isEmpty) return;

    if (!_memberEmails.contains(email)) {
      setState(() {
        _memberEmails.add(email);
      });
    }

    _emailController.clear();
  }

  void _removeMember(int index) {
    setState(() {
      _memberEmails.removeAt(index);
    });
  }

  Future<void> _createGroup() async {
    final groupName = _groupNameController.text.trim();

    if (groupName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a group name')),
      );
      return;
    }

    await widget.onCreate(groupName, _memberEmails);

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(maxHeight: 600, minWidth: 350),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Create Group',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Text(
              'Create a travel group and invite members',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            GroupNameField(controller: _groupNameController),

            const SizedBox(height: 20),

            MemberEmailInput(controller: _emailController, onAdd: _addMember),

            const SizedBox(height: 20),

            Row(
              children: [
                const Text(
                  'Members',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const Spacer(),

                CircleAvatar(
                  radius: 12,
                  child: Text(
                    _memberEmails.length.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Expanded(
              child: MemberList(emails: _memberEmails, onDelete: _removeMember),
            ),

            const SizedBox(height: 16),

            CreateGroupButton(onPressed: _createGroup),
          ],
        ),
      ),
    );
  }
}
