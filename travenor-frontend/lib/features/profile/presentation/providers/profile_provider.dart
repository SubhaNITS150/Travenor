import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:travenor/features/profile/data/services/profile_service.dart';
import 'package:travenor/features/profile/presentation/providers/profile_notifier.dart';
import 'package:travenor/features/profile/presentation/providers/profile_state.dart';

final profileServiceProvider =
    Provider<ProfileService>((ref) {
  return ProfileService();
});

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) {
    return ProfileNotifier(
      ref.read(profileServiceProvider),
    );
  },
);