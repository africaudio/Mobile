import 'package:abook/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Save',
              style: TextStyle(
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? AppColors.faintDark
                    : AppColors.primaryPurple,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? Colors.white
                : AppColors.audioBlack,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        iconTheme: IconThemeData(
          color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
              ? Colors.white
              : AppColors.audioBlack,
        ),
        backgroundColor:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.darkbgColor
                : Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? AppColors.faintDark
                  : AppColors.audioGrey,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 160.0,
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/67/cd/4a/67cd4a8973276266506572d36e46af82.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Divider(
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? AppColors.faintDark
                  : AppColors.audioGrey,
            ),
          ],
        ),
      ),
    );
  }
}
