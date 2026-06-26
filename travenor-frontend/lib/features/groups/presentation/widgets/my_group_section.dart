import 'package:flutter/material.dart';
import 'package:travenor/features/groupchat/presentation/screens/group_chat_screen.dart';
import 'package:travenor/features/groups/data/groups_service.dart';
import 'group_card.dart';

class MyGroupsSection extends StatefulWidget {
  const MyGroupsSection({super.key});

  @override
  State<MyGroupsSection> createState() => _MyGroupsSectionState();
}

class _MyGroupsSectionState extends State<MyGroupsSection> {
  final GroupService _groupService = GroupService();

  List<dynamic> groups = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchGroups();
  }

  Future<void> fetchGroups() async {
    try {
      final result = await _groupService.getMyGroups();
      setState(() {
        groups = result;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "My Travel Groups",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            TextButton(
              onPressed: () {},
              child: const Text(
                "See all",
                style: TextStyle(
                  color: Color(0xFF5B4CFF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 290,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            itemCount: groups.length,

            separatorBuilder: (_, __) => const SizedBox(width: 16),

            itemBuilder: (context, index) {
              final group = groups[index];

              return GroupCard(
                title: group['name'],

                subtitle: 'Travel planning group',

                icon: Icons.groups,

                color: Colors.deepPurple,

                destination: 'Shillong',

                travelers: group['memberCount'] ?? 0,

                startsIn: '8 days',

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GroupChatScreen(
                        groupName: group['name'],
                        destination: '',
                        travelers: group['_count']?['members'] ?? 0,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
