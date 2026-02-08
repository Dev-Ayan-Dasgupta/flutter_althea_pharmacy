import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../data/repositories/mock_profile_repository.dart';
import 'profile_state.dart';

part 'profile_provider.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return MockProfileRepository();
}

@riverpod
class Profile extends _$Profile {
  @override
  ProfileState build() {
    loadProfile();
    return const ProfileState.initial();
  }

  Future<void> loadProfile() async {
    state = const ProfileState.loading();

    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.getProfile();

    result.fold(
      (error) => state = ProfileState.error(error),
      (profile) => state = ProfileState.loaded(profile),
    );
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.updateProfile(profile);

    result.fold(
      (error) {
        // Handle error
      },
      (_) {
        loadProfile();
      },
    );
  }
}
