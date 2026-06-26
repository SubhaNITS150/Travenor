import 'package:flutter/material.dart';
import 'package:travenor/features/profile/presentation/widgets/groups_section.dart';
import 'package:travenor/features/profile/presentation/widgets/meeting_history_card.dart';
import 'package:travenor/features/profile/presentation/widgets/personal_info_card.dart';
import 'package:travenor/features/profile/presentation/widgets/profile_back_button.dart';
import 'package:travenor/features/profile/presentation/widgets/profile_header.dart';
import 'package:travenor/features/profile/presentation/widgets/saved_trip_sections.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              ProfileBackButton(),
              
              SizedBox(height: 20),

              ProfileHeader(),

              SizedBox(height: 20),

              PersonalInfoCard(),

              SizedBox(height: 20),

              MeetingHistoryCard(),

              SizedBox(height: 20),

              SavedTripsSection(),

              SizedBox(height: 20),

              GroupsSection(),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}