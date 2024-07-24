import 'dart:convert';

import 'package:abook/data/models/user_profile_model.dart';
import 'package:abook/index.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserService {
  // Function to update user
  Future<bool> updateUserProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String city,
    required String state,
    required String country,
    required String accountType,
    required String tk,
  }) async {
    var headers = {
      'Authorization': 'Bearer $tk',
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('https://api-oggo.onrender.com/api/v1/user/profile');

    var response = await http.put(
      url,
      headers: headers,
      body: jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "city": city,
        "state": state,
        "country": country,
        "acountType": accountType,
      }),
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (kDebugMode) {
        print(responseData);
      }

      if (responseData['ok'] == true) {
        if (kDebugMode) {
          print('Request successful.');
        }
        return true;
      } else {
        if (kDebugMode) {
          print('Request failed.');
        }
        return false;
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}');
      }
      return false;
    }
  }

  // function to get user information
  Future<UserProfileModel?> getUserProfile({
    required String tk,
  }) async {
    var headers = {
      'Authorization': 'Bearer $tk',
    };

    var url = Uri.parse('https://api-oggo.onrender.com/api/v1/user/profile');

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['ok'] == true) {
        var userProfileJson = responseData['data'];
        userProfileObj = UserProfileModel.fromJson(userProfileJson);
        if (kDebugMode) {
          print('User profile retrieved successfully:');
        }
        if (kDebugMode) {
          print(userProfileObj);
        }
        // Save the model as needed
        return userProfileObj;
      } else {
        if (kDebugMode) {
          print('Request failed. Server response: $responseData');
        }
        return null;
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}');
      }
      return null;
    }
  }
}
