import '../../../product/models/user/user_model.dart';
import '../service/profile_service.dart';

class ProfileController {
  final ProfileService _profileService = ProfileService();

  Future<UserModel> getProfile() async {
    return _profileService.getProfile();
  }

  Future<void> signOut() async {
    return _profileService.signOut();
  }
}
