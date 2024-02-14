class UserModel {
  final String? name;
  final String? email;
  final String? imageUrl;
  final String? address;
  final int? participatedEvents;
  final int? organizedEvents;
  final int? followers;
  final int? following;
  final String? bio;
  final String? ranking;
  final List<String>? leaders;

  UserModel({
    this.name,
    this.email,
    this.imageUrl,
    this.address,
    this.participatedEvents,
    this.organizedEvents,
    this.followers,
    this.following,
    this.bio,
    this.ranking,
    this.leaders,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? imageUrl,
    String? address,
    int? participatedEvents,
    int? organizedEvents,
    int? followers,
    int? following,
    String? bio,
    String? ranking,
    List<String>? leaders,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
      participatedEvents: participatedEvents ?? this.participatedEvents,
      organizedEvents: organizedEvents ?? this.organizedEvents,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      bio: bio ?? this.bio,
      ranking: ranking ?? this.ranking,
      leaders: leaders ?? this.leaders,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'address': address,
      'participatedEvents': participatedEvents,
      'organizedEvents': organizedEvents,
      'followers': followers,
      'following': following,
      'bio': bio,
      'ranking': ranking,
      'leaders': leaders,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      imageUrl: map['imageUrl'],
      address: map['address'],
      participatedEvents: map['participatedEvents'],
      organizedEvents: map['organizedEvents'],
      followers: map['followers'],
      following: map['following'],
      bio: map['bio'],
      ranking: map['ranking'],
      leaders: List<String>.from(map['leaders']),
    );
  }
}
