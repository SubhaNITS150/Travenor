import 'package:flutter/material.dart';
import 'package:travenor/features/explore/presentation/screens/explore_screen.dart';
import 'package:travenor/features/groups/presentation/screens/groups_screen.dart';
import 'package:travenor/features/home/presentation/screens/home_screen.dart';
import 'package:travenor/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:travenor/features/meetings/presentation/screens/meeting_analysis_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ExploreScreen(),
    GroupsScreen(),
    MeetingAnalysisScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: changeTab,
      ),
    );
  }
}