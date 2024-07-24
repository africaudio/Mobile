import 'package:abook/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';

import 'bare_argon.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onTap,
    required this.title,
    this.height,
    this.width,
  }) : super(key: key);
  final Function(Function, Function, ButtonState)? onTap;
  final String title;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: height != null ? height! * ScreenRatio.heightRatio : 55,
      width: width != null
          ? width! * ScreenRatio.widthRatio
          : ScreenRatio.absoluteWidth,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      minWidth: 100,
      borderRadius: 2,
      color: AppColors.primaryPurple,
      loader: const CircularProgressIndicator(color: Colors.white),
      onTap: onTap,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18 * ScreenRatio.fontRatio,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
    this.context, {
    Key? key,
    this.onTap,
    required this.title,
    this.height,
    this.width,
    this.color,
    this.bgColor,
  }) : super(key: key);
  final Function(Function, Function, ButtonState)? onTap;
  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final Color? bgColor;

  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: height != null ? height! * ScreenRatio.heightRatio : 55,
      width: width != null
          ? width! * ScreenRatio.widthRatio
          : ScreenRatio.absoluteWidth,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      minWidth: 200,
      borderRadius: 7 * ScreenRatio.heightRatio,
      color: AppColors.primaryPurple,
      borderSide: BorderSide(
        color: AdaptiveTheme.of(context).mode.isDark
            ? color ?? Colors.white
            : color ?? AppColors.secondaryOrange,
      ),
      loader: const CircularProgressIndicator(color: Colors.white),
      onTap: onTap,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17 * ScreenRatio.fontRatio,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class SecondaryButton2 extends StatelessWidget {
  const SecondaryButton2(
    this.context, {
    Key? key,
    this.onTap,
    required this.title,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);
  final Function(Function, Function, ButtonState)? onTap;
  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: height != null ? height! * ScreenRatio.heightRatio : 55,
      width: width != null
          ? width! * ScreenRatio.widthRatio
          : ScreenRatio.absoluteWidth,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      minWidth: 200,
      borderRadius: 8 * ScreenRatio.heightRatio,
      color: Colors.transparent,
      loader: SizedBox(
          width: 25 * ScreenRatio.widthRatio,
          height: 25 * ScreenRatio.heightRatio,
          child: CircularProgressIndicator(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? color ?? Colors.white
                : color ?? AppColors.secondaryOrange,
          )),
      onTap: onTap,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? color ?? Colors.white
                : color ?? AppColors.secondaryOrange,
            fontSize: 18 * ScreenRatio.fontRatio,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
