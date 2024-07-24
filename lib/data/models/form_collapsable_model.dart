import 'package:flutter/material.dart';

class FormCollapsableModel {
  bool isExpanded;
  final String header;
  final Widget body;
  FormCollapsableModel({
    required this.isExpanded,
    required this.header,
    required this.body,
  });
}
