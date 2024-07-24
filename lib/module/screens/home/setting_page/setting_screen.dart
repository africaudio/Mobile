import 'package:abook/index.dart';
import 'package:abook/module/screens/home/setting_page/view_profile_screen.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Settings',
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
            const Divider(),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/67/cd/4a/67cd4a8973276266506572d36e46af82.jpg'),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Armored Titan',
                          style: TextStyle(
                            color: AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.dark
                                ? Colors.white
                                : AppColors.audioBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            si.routerService
                                .nextRoute(context, const ViewProfileScreen());
                          },
                          child: Text(
                            'View Profile',
                            style: TextStyle(
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? const Color.fromARGB(255, 129, 116, 243)
                                      .withOpacity(0.9)
                                  : AppColors.primaryPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 28.0,
              decoration: BoxDecoration(
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? AppColors.faintDark
                    : AppColors.cardBackground,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Data and Storages',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 28.0,
              decoration: BoxDecoration(
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? AppColors.faintDark
                    : AppColors.cardBackground,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Subscriptions',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Linked Accounts',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 28.0,
              decoration: BoxDecoration(
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? AppColors.faintDark
                    : AppColors.cardBackground,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'About AudioBook',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56.0,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.secondaryOrange),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: AppColors.secondaryOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
