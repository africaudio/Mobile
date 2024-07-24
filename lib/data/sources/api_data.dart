import 'dart:convert';
import 'dart:io';

import 'package:abook/data/models/auth_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class ApiData {
  Future<ApiResponseModel?> postRequest(
    String url, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    ApiResponseModel? apiResponse;
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        apiResponse = ApiResponseModel(
          ok: data['ok'],
          message: data['message'],
        );
      } else {
        final data = jsonDecode(response.body);
        apiResponse = ApiResponseModel(
          ok: data['ok'],
          message: data['message'],
        );
      }
    } on SocketException catch (_) {
      return null;
    }
    return apiResponse;
  }

  Future<AuthModel?> authRequest(
    String url, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    AuthModel? authResponse;
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        authResponse = AuthModel(
          ok: data['ok'],
          user: data['user'],
          accessToken: data['accessToken'],
        );
      } else {
        final data = jsonDecode(response.body);
        authResponse = AuthModel(
          ok: data['ok'],
          user: data['user'],
          accessToken: data['accessToken'],
        );
      }
    } on SocketException catch (_) {
      return null;
    }
    return authResponse;
  }

  Future<AuthModel?> registerRequest(
    String url, {
    Object? body,
    Map<String, String>? headers,
  }) async {
    AuthModel? authResponse;
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (kDebugMode) {
          print(response.body);
        }
        authResponse = AuthModel(
          ok: data['ok'],
          user: data['user'],
          accessToken: data['accessToken'],
        );
      } else {
        final data = jsonDecode(response.body);
        if (kDebugMode) {
          print(response.body);
        }
        authResponse = AuthModel(
          ok: data['ok'],
          accessToken: data['message'],
        );
      }
    } on SocketException catch (_) {
      return null;
    }
    return authResponse;
  }
}

ApiData api = ApiData();
