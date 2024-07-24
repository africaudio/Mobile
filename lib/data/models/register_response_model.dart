import 'dart:convert';

RegisterResponseModel registerResponseModelFromMap(String str) =>
    RegisterResponseModel.fromMap(json.decode(str));

String registerResponseModelToMap(RegisterResponseModel data) =>
    json.encode(data.toMap());

class RegisterResponseModel {
  RegisterResponseModel({
    required this.ok,
    required this.accessToken,
  });

  final bool ok;
  final String accessToken;

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        ok: json["ok"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "accessToken": accessToken,
      };
}
