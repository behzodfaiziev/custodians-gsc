import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReportModel {
  ReportModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.imageUrl,
    this.location,
    this.date,
    this.time,
    this.status,
    this.createdBy,
    this.createdDate,
    this.requiredPeople,
    this.currentPeople,
    this.isEnded,
    this.latitude,
    this.longitude,
    this.participants,
  });

  final String? id;
  final String? userId;
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
  final double? latitude;
  final double? longitude;
  final List<String>? participants;

  LatLng get latLng => LatLng(latitude!, longitude!);

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
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
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      participants: (json['participants'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
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
      'latitude': latitude,
      'longitude': longitude,
      'participants': participants,
    };
  }

  ReportModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? imageUrl,
    String? location,
    String? date,
    String? time,
    String? status,
    String? createdBy,
    String? createdDate,
    int? requiredPeople,
    int? currentPeople,
    bool? isEnded,
    double? latitude,
    double? longitude,
    List<String>? participants,
  }) {
    return ReportModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      requiredPeople: requiredPeople ?? this.requiredPeople,
      currentPeople: currentPeople ?? this.currentPeople,
      isEnded: isEnded ?? this.isEnded,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      participants: participants ?? this.participants,
    );
  }
}
