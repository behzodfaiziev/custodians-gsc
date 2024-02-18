import '../../../product/models/report/report_model.dart';
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

  Future<List<ReportModel>> getParticipatedEvents() async {
    return await _profileService.getParticipatedEvents();
  }
}
