import 'package:abook/data/models/form_collapsable_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UtilityService {
  Widget setSvgFromAsset({required String svg, double? height}) {
    return SizedBox(
      height: height,
      child: SvgPicture.asset(
        svg,
      ),
    );
  }

  List<DropdownMenuItem> getDropdownItems(List items) {
    List<DropdownMenuItem> dropdowmItems = [];

    for (String item in items) {
      var newItem = DropdownMenuItem(value: item[0], child: Text(item));
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }

  List<FormCollapsableModel> getFormCollapsableList(
      {required bool isExpanded,
      required String header,
      required Widget body}) {
    List<FormCollapsableModel> basicInfoItems = <FormCollapsableModel>[
      FormCollapsableModel(
        isExpanded: isExpanded, // isExpanded ?
        header: header, // header
        body: body,
      ),
    ];
    return basicInfoItems;
  }
}
