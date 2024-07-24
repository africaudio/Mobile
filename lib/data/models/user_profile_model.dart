import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  final String id;
  final String userId;
  final String email;
  final List<dynamic> categories;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int v;
  final String country;
  final String firstName;
  final String lastName;
  final String phone;

  UserProfileModel({
    required this.id,
    required this.userId,
    required this.email,
    required this.categories,
    required this.updatedAt,
    required this.createdAt,
    required this.v,
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["_id"],
        userId: json["userId"],
        email: json["email"],
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        country: json["country"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "email": email,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "country": country,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
      };
}
