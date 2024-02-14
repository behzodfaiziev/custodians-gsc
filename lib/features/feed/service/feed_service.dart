import '../../../product/models/report/report_model.dart';

class FeedService {
  Future<List<ReportModel>> getReports() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      ReportModel(
        id: '1',
        title: 'Picking Up Garbage From Forest',
        description: 'Description 1',
        location: 'Germany, Berlin',
        date: DateTime.now().toIso8601String(),
        imageUrl: 'https://picsum.photos/200/300',
        createdBy: 'User 1',
        createdDate: DateTime.now().toIso8601String(),
        currentPeople: 1,
        isEnded: false,
        requiredPeople: 5,
        status: 'Working on',
        time: 'Time 1',
      ),
      ReportModel(
        id: '2',
        title: 'Sea Bottom Cleaning',
        description: 'Description 2',
        location: 'Türkiye, Hatay, İskenderun',
        date: DateTime.now().toIso8601String(),
        imageUrl: 'https://picsum.photos/200/300',
        createdBy: 'User 2',
        createdDate: DateTime.now().toIso8601String(),
        currentPeople: 2,
        isEnded: false,
        requiredPeople: 5,
        status: 'Working on',
        time: 'Time 2',
      ),
      ReportModel(
        id: '3',
        title: 'Helping Homeless People',
        description: 'Description 3',
        location: 'USA, New York',
        date: DateTime.now().toIso8601String(),
        imageUrl: 'https://picsum.photos/200/300',
        createdBy: 'User 3',
        createdDate: DateTime.now().toIso8601String(),
        currentPeople: 3,
        isEnded: false,
        requiredPeople: 5,
        status: 'Working on',
        time: 'Time 3',
      ),
    ];
  }
}
