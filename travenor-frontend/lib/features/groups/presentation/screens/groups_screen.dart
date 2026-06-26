import 'package:flutter/material.dart';
import 'package:travenor/features/groups/presentation/widgets/create_group_fab.dart';
import 'package:travenor/features/groups/presentation/widgets/explore_group_section.dart';
import 'package:travenor/features/groups/presentation/widgets/groups_header.dart';
import 'package:travenor/features/groups/presentation/widgets/groups_search_bar.dart';
import 'package:travenor/features/groups/presentation/widgets/groups_tab_selector.dart';
import 'package:travenor/features/groups/presentation/widgets/my_group_section.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),

      floatingActionButton: const CreateGroupFab(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              GroupsHeader(),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GroupsSearchBar(),
              ),

              SizedBox(height: 16),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GroupsTabSelector(),
              ),

              SizedBox(height: 24),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: MyGroupsSection(),
              ),

              SizedBox(height: 24),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ExploreGroupsSection(),
              ),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}