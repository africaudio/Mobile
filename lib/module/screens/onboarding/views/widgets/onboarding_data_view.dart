import 'package:abook/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/models.dart';

class OnboardingDataView extends StatelessWidget {
  const OnboardingDataView(this.onboardingDataModel, {Key? key})
      : super(key: key);
  final OnboardingDataModel onboardingDataModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(onboardingDataModel.illustration),
        Text(
          onboardingDataModel.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15 * ScreenRatio.fontRatio,
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.audioGrey
                : AppColors.audioBlack,
          ),
        ),
        Text(
          onboardingDataModel.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.audioGrey
                : AppColors.audioGrey,
            fontSize: 15 * ScreenRatio.fontRatio,
          ),
        ),
      ],
    );
  }
}
