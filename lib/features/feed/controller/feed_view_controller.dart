import 'package:custodians/features/feed/service/feed_service.dart';
import 'package:custodians/product/models/report/report_model.dart';

class FeedViewController {
  final FeedService _feedService = FeedService();

  Future<List<ReportModel>> getReports() async {
    return await _feedService.getReports();
  }

}
