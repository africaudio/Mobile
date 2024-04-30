import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:abook/index.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<String?> register({
    required String email,
    required String password,
  }) async {
    String? signUpMesaage;
    try {
      Uri uri = Uri.parse('$baseUrl/api/v1/auth/register');
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
          "userType": "user",
        }),
      );

      if (response.statusCode == 200) {
        signUpMesaage = 'User created successfully, activate your account';
        return signUpMesaage;
      } else {
        final data = jsonDecode(response.body);
        signUpMesaage = data['message'].toString();
        return signUpMesaage;
      }
    } on SocketException catch (_) {
      return null;
    } on TimeoutException catch (_) {
      signUpMesaage = null;
    }
    return signUpMesaage;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(
      '$baseUrl/api/v1/auth/login',
    );
    // Convert model object to JSON
    final jsonBody = json.encode({
      "email": email,
      "password": password,
      "notification_id": "futfuytiyt78576476568"
    });
    // Set headers
    final headers = {
      'Content-Type': 'application/json',
    };
    // Send POST request
    final response = await http.post(
      url,
      headers: headers,
      body: jsonBody,
    );
    try {
      final data = jsonDecode(response.body);
      if (data['ok'] == true) {
        print('Response body: ${data['token']}');
        token = data['token'];
        return data['token'];
      } else {
        print('POST request failed with status code ${data['message']}');
        return data['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> resetPassword({
    required String email,
  }) async {
    final url = Uri.parse(
      '$baseUrl/api/v1/auth/request-password-reset',
    );
    // Convert model object to JSON
    final jsonBody = json.encode({
      "email": email,
    });
    // Set headers
    final headers = {
      'Content-Type': 'application/json',
    };
    // Send POST request
    final response = await http.post(
      url,
      headers: headers,
      body: jsonBody,
    );
    try {
      final data = jsonDecode(response.body);
      if (data['ok'] == true) {
        print('Response body: ${data['ok']}');
        return data['ok'];
      } else {
        print('POST request failed with status code ${data['ok']}');
        return data['ok'];
      }
    } catch (e) {
      return false;
    }
  }
}
