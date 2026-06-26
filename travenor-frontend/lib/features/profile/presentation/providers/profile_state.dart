class ProfileState {
  final bool isLoading;
  final String firstName;
  final String lastName;
  final String email;

  const ProfileState({
    this.isLoading = false,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
  });

  ProfileState copyWith({
    bool? isLoading,
    String? firstName,
    String? lastName,
    String? email,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }
}