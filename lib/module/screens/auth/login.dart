import 'package:abook/index.dart';
import 'package:abook/module/screens/auth/forget_password_screen.dart';
import 'package:abook/module/screens/auth/sign_up.dart';
import 'package:abook/module/screens/auth/update_profile_details_screen.dart';
import 'package:abook/shared/widgets/buttons/primary_button.dart';
import 'package:abook/shared/widgets/forms/audio_text_field.dart';
import 'package:abook/shared/widgets/forms/logo_widget.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool termsState = false;
  String? countryCode;
  String? mobileNumber;
  bool isLoading = false;
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        'Login to Your Account',
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
                        height: 16.0,
                      ),
                      AudioTextField(
                        controller: email,
                        hintText: 'Email',
                        obsrcure: false,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      AudioTextField(
                        controller: password,
                        hintText: 'Password',
                        obsrcure: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: termsState,
                            activeColor: AppColors.primaryPurple,
                            checkColor: Colors.white,
                            side: const BorderSide(
                              color: AppColors.primaryPurple,
                            ),
                            onChanged: (value) {
                              setState(() {
                                termsState = !termsState;
                              });
                            },
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? Colors.white
                                  : AppColors.audioBlack,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      isLoading == false
                          ? PrimaryAudioButton(
                              text: 'Login',
                              onTap: () async {
                                // si.routerService.popReplaceRoute(
                                //     context, const BottomNav());
                                setState(() {
                                  isLoading = true;
                                });
                                await si.authService
                                    .loginUser(
                                        email: email.text,
                                        password: password.text)
                                    .then((value) {
                                  if (value == token) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    si.routerService.popReplaceRoute(context,
                                        const UpdateProfileDetailScreen());
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(value)));
                                  }
                                });
                              },
                            )
                          : const Center(
                              child: SpinKitWave(
                                color: AppColors.secondaryOrange,
                              ),
                            ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              si.routerService.nextRoute(
                                  context, const ForgetPasswordScreen());
                            },
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryOrange,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Don’t have an accoun’t ?',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? Colors.white
                                  : AppColors.audioBlack,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // AdaptiveTheme.of(context).toggleThemeMode();
                              si.routerService
                                  .nextRoute(context, const SignUpScreen());
                            },
                            child: const Text(
                              '   Register',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondaryOrange,
                              ),
                            ),
                          ),
                          // TextButton(
                          //     onPressed: () {
                          //       si.routerService.nextRoute(
                          //           context, VideoConferenceScreen());
                          //     },
                          //     child: Text('Google')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
