import '../../../product/models/report/report_model.dart';
import '../service/map_service.dart';

class MapController {
  final MapService _mapService = MapService();

  Future<List<ReportModel>> getReports() async {
    return await _mapService.getReports();
  }
}
