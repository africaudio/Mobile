import 'dart:convert';

AuthModel authModelFromMap(String str) => AuthModel.fromMap(json.decode(str));

String authModelToMap(AuthModel data) => json.encode(data.toMap());

class AuthModel {
  AuthModel({
    required this.ok,
    this.user,
    required this.accessToken,
  });

  final bool ok;
  final User? user;
  final String accessToken;

  factory AuthModel.fromMap(Map<String, dynamic> json) => AuthModel(
        ok: json["ok"],
        user: User.fromMap(json["user"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "user": user!.toMap(),
        "accessToken": accessToken,
      };
}

class User {
  User({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.userType,
    required this.status,
    required this.isVerified,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.v,
  });

  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String userType;
  final String status;
  final bool isVerified;
  final String updatedAt;
  final String createdAt;
  final String id;
  final int v;

  factory User.fromMap(Map<String, dynamic> json) => User(
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        userType: json["userType"],
        status: json["status"],
        isVerified: json["isVerified"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "userType": userType,
        "status": status,
        "isVerified": isVerified,
        "updatedAt": updatedAt,
        "createdAt": createdAt,
        "_id": id,
        "__v": v,
      };
}
