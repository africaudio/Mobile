import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  Future<bool> addListToSharedPreference(
      {required String key, required List<String> value}) async {
    final store = await SharedPreferences.getInstance();
    bool hasAdded = await store.setStringList(key, value);
    return hasAdded;
  }

  Future<List<String>?> getListFromSharedPreference(
      {required String key}) async {
    final store = await SharedPreferences.getInstance();
    return store.getStringList(key);
  }

  Future<bool> addStringToSharedPreference(
      {required String key, required String value}) async {
    final store = await SharedPreferences.getInstance();
    bool hasAdded = await store.setString(key, value);
    return hasAdded;
  }

  Future<String?> getStringFromSharedPreference({required String key}) async {
    final store = await SharedPreferences.getInstance();
    return store.getString(key);
  }

  Future<bool> addBoolToSharedPreference(
      {required String key, required bool value}) async {
    final store = await SharedPreferences.getInstance();
    return store.setBool(key, value);
  }

  Future<bool?> getBoolFromSharedPreference({required String key}) async {
    final store = await SharedPreferences.getInstance();
    return store.getBool(key);
  }
}

LocalData localData = LocalData();
