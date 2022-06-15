import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    print("getting stored savedData");
    getSavedList();
    print("gotten stored savedData");
  }

  List<Map<String, dynamic>> storedList = [];
  static const keySavedList = "StoredList";

  Future<void> saveEbookList(List<Map<String, dynamic>> item) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(keySavedList, jsonEncode(item));
  }

  Future<void> getSavedList() async {
    List<Map<String, dynamic>> saved = [];
    saved = jsonDecode(
            _preferences.getString(keySavedList) ?? <String>[].toString())
        .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
        .toList();
    storedList.addAll(saved);
  }
}
