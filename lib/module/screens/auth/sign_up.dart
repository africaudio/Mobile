import 'package:abook/index.dart';
import 'package:abook/shared/widgets/buttons/outlined_button.dart';
import 'package:abook/shared/widgets/buttons/primary_button.dart';
import 'package:abook/shared/widgets/forms/audio_text_field.dart';
import 'package:abook/shared/widgets/forms/logo_widget.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  String? countryCode;
  String? mobileNumber;
  TextEditingController phone = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
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
                    const Text(
                      'Register',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    // AudioTextField(
                    //   controller: fName,
                    //   hintText: 'First Name',
                    //   obsrcure: false,
                    //   keyboardType: TextInputType.text,
                    // ),
                    // const SizedBox(
                    //   height: 16.0,
                    // ),
                    // AudioTextField(
                    //   controller: lName,
                    //   hintText: 'Last Name',
                    //   obsrcure: false,
                    //   keyboardType: TextInputType.text,
                    // ),
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
                    // Card(
                    //   color: AdaptiveTheme.of(context).mode ==
                    //           AdaptiveThemeMode.dark
                    //       ? AppColors.faintDark
                    //       : Colors.white,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15.0),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 10.sp, vertical: 5.sp),
                    //     child: InternationalPhoneNumberInput(
                    //       textFieldController: phone,
                    //       maxLength: 12,
                    //       onInputChanged: (PhoneNumber value) {
                    //         countryCode = value.dialCode;
                    //         mobileNumber = value.phoneNumber;
                    //         // print('$countryCode$mobileNumber');
                    //         // print(phone.text);
                    //       },
                    //       countries: const ["NG"],
                    //       autoFocus: false,
                    //       selectorTextStyle: TextStyle(
                    //         fontSize: 14.sp,
                    //         color: AdaptiveTheme.of(context).mode ==
                    //                 AdaptiveThemeMode.dark
                    //             ? Colors.white
                    //             : AppColors.audioBlack,
                    //       ),
                    //       textStyle: TextStyle(
                    //         fontSize: 14.sp,
                    //       ),
                    //       countrySelectorScrollControlled: false,
                    //       textAlign: TextAlign.left,
                    //       formatInput: true,
                    //       validator: (value) =>
                    //           value!.isEmpty || value.length < 5 ? null : null,
                    //       ignoreBlank: true,
                    //       spaceBetweenSelectorAndTextField: 0,
                    //       inputDecoration: InputDecoration(
                    //         fillColor: AppColors.audioGrey.withOpacity(0.2),
                    //         filled: true,
                    //         border: InputBorder.none,
                    //         focusedBorder: InputBorder.none,
                    //         enabledBorder: InputBorder.none,
                    //         errorBorder: InputBorder.none,
                    //         disabledBorder: InputBorder.none,
                    //         hintText: "Phone Number",
                    //         hintTextDirection: TextDirection.ltr,
                    //         hintStyle: TextStyle(
                    //           color: AdaptiveTheme.of(context).mode ==
                    //                   AdaptiveThemeMode.dark
                    //               ? AppColors.audioGrey
                    //               : Colors.grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 16.0,
                    // ),
                    AudioTextField(
                      controller: password,
                      hintText: 'Password',
                      obsrcure: true,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    // AudioTextField(
                    //   controller: dob,
                    //   hintText: 'Date of Birth',
                    //   obsrcure: false,
                    //   keyboardType: TextInputType.text,
                    // ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "By signing up, you agree to our ",
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? Colors.white
                              : AppColors.audioBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: "Terms, Data Policy",
                            style: TextStyle(
                              color: AppColors.secondaryOrange,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: " and ",
                            style: TextStyle(
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? Colors.white
                                  : AppColors.audioBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          const TextSpan(
                            text: "Cookies Policy.",
                            style: TextStyle(
                              color: AppColors.secondaryOrange,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    isLoading == false
                        ? PrimaryAudioButton(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              final response = await si.authService.register(
                                email: email.text,
                                password: password.text,
                              );
                              if (response == null) {
                                setState(() {
                                  isLoading = false;
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      response.toString(),
                                    ),
                                  ),
                                );
                              } else if (response ==
                                  'User created successfully, activate your account') {
                                setState(() {
                                  isLoading = false;
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      response.toString(),
                                    ),
                                  ),
                                );
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      response.toString(),
                                    ),
                                  ),
                                );
                              }
                              // setState(() {
                              //   isLoading = false;
                              // });
                            },
                            text: 'Register',
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    OutlinedPrimaryButton(
                      text: 'Cancel',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
