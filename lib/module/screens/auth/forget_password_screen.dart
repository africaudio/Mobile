import 'package:abook/index.dart';
import 'package:abook/module/screens/auth/link_sent_screen.dart';
import 'package:abook/shared/widgets/buttons/outlined_button.dart';
import 'package:abook/shared/widgets/buttons/primary_button.dart';
import 'package:abook/shared/widgets/forms/audio_text_field.dart';
import 'package:abook/shared/widgets/forms/logo_widget.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          child: Column(
            children: [
              const LogoWidget(),
              const SizedBox(
                height: 40.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget Password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Please fill email and we\'ll send you a link to get back into your account.',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  AudioTextField(
                    controller: email,
                    hintText: 'Email Address',
                    obsrcure: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  isLoading == false
                      ? PrimaryAudioButton(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await si.authService
                                .resetPassword(
                              email: email.text,
                            )
                                .then((value) {
                              if (value == true) {
                                setState(() {
                                  isLoading = false;
                                });
                                si.routerService
                                    .nextRoute(context, const LinkSentScreen());
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Email sent successfully')));
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Error occured')));
                              }
                            });
                          },
                          text: 'Submit')
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  OutlinedPrimaryButton(onTap: () {}, text: 'Cancel')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
