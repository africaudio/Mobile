import 'package:abook/index.dart';
import 'package:abook/module/screens/landing_page/welcome_home_screen.dart';
import 'package:abook/shared/widgets/forms/audio_text_field.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class UpdateProfileDetailScreen extends StatefulWidget {
  const UpdateProfileDetailScreen({super.key});

  @override
  State<UpdateProfileDetailScreen> createState() =>
      _UpdateProfileDetailScreenState();
}

class _UpdateProfileDetailScreenState extends State<UpdateProfileDetailScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Personal Details',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioBlack,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                AudioTextField(
                  controller: firstName,
                  hintText: 'First name',
                  obsrcure: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                AudioTextField(
                  controller: lastName,
                  hintText: 'Last name',
                  obsrcure: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                AudioTextField(
                  controller: phoneNumber,
                  hintText: 'Phone',
                  obsrcure: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                AudioTextField(
                  controller: city,
                  hintText: 'City',
                  obsrcure: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                AudioTextField(
                  controller: state,
                  hintText: 'State',
                  obsrcure: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                PrimaryButton(
                  title: 'Update',
                  onTap: (startLoading, stopLoading, btnState) async {
                    startLoading();
                    final response = await si.userService.updateUserProfile(
                      firstName: firstName.text,
                      lastName: lastName.text,
                      phone: phoneNumber.text,
                      city: city.text,
                      state: state.text,
                      country: 'Nigeria',
                      accountType: 'individual',
                      tk: token,
                    );
                    if (response == true) {
                      stopLoading();
                      // ignore: use_build_context_synchronously
                      si.routerService.popReplaceRoute(
                        context,
                        const WelcomeHomeScreen(),
                      );
                    } else {
                      stopLoading();
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('An Error has occured')));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
