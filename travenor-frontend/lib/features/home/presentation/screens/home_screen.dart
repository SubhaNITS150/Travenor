import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:travenor/features/home/presentation/widgets/featured_trip_section.dart';
import 'package:travenor/features/home/presentation/widgets/home_header.dart';
import 'package:travenor/features/home/presentation/widgets/manage_meeting_cards.dart';
import 'package:travenor/features/home/presentation/widgets/places_you_may_like.dart';
import 'package:travenor/features/home/presentation/widgets/previous_trip_section.dart';
import 'package:travenor/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:travenor/features/profile/presentation/providers/profile_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(profileProvider.notifier)
          .loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HomeHeader(),
              SizedBox(height: 10),
              SearchBarWidget(),
              FeaturedTripsSection(),
              PreviousTripsSection(),
              PlacesYouMayLikeSection(),
              ManageMeetingsCard(),
            ],
          ),
        ),
      ),
    );
  }
}