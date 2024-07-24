import 'dart:collection';

import 'package:flutter/material.dart';

class PersonalizeProvide extends ChangeNotifier {
  final List<String> _selectedPersonalize = [];
  UnmodifiableListView<String> get selectedPersonalize =>
      UnmodifiableListView(_selectedPersonalize);

  void addSuggestion(String suggestion) {
    _selectedPersonalize.add(suggestion);
    notifyListeners();
  }
}
