// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:travenor/core/storage/token_storage.dart';
import 'package:travenor/features/profile/data/services/profile_service.dart';
import 'package:travenor/features/profile/presentation/providers/profile_state.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileService profileService;

  ProfileNotifier(this.profileService)
      : super(const ProfileState());

  Future<void> loadProfile() async {
    try {
      // Prevent unnecessary API calls
      if (state.firstName.isNotEmpty) return;

      state = state.copyWith(
        isLoading: true,
      );

      final prefs = await SharedPreferences.getInstance();

      final userId = prefs.getString('userId');
      final accessToken = await TokenStorage.getAccessToken();

      if (userId == null || accessToken == null) {
        throw Exception('User not logged in');
      }

      final profile = await profileService.getProfileInfo(
        userId: userId,
        accessToken: accessToken,
      );

      state = state.copyWith(
        isLoading: false,
        firstName: profile['firstName'] ?? '',
        lastName: profile['lastName'] ?? '',
        email: profile['email'] ?? '',
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );

      print('ProfileNotifier Error: $e');
    }
  }

  void clearProfile() {
    state = const ProfileState();
  }
}