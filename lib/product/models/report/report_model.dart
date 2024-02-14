class ReportModel {
  ReportModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.date,
    required this.time,
    required this.status,
    required this.createdBy,
    required this.createdDate,
    required this.requiredPeople,
    required this.currentPeople,
    required this.isEnded,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? location;
  final String? date;
  final String? time;
  final String? status;
  final String? createdBy;
  final String? createdDate;
  final int? requiredPeople;
  final int? currentPeople;
  final bool? isEnded;

  ReportModel fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      location: json['location'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String,
      createdDate: json['createdDate'] as String,
      requiredPeople: json['requiredPeople'] as int,
      currentPeople: json['currentPeople'] as int,
      isEnded: json['isEnded'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'location': location,
      'date': date,
      'time': time,
      'status': status,
      'createdBy': createdBy,
      'createdDate': createdDate,
      'requiredPeople': requiredPeople,
      'currentPeople': currentPeople,
      'isEnded': isEnded,
    };
  }
}
