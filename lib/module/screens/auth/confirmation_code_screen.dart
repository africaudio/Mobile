import 'package:abook/index.dart';
import 'package:abook/shared/widgets/buttons/outlined_button.dart';
import 'package:abook/shared/widgets/buttons/primary_button.dart';
import 'package:abook/shared/widgets/forms/audio_text_field.dart';
import 'package:abook/shared/widgets/forms/logo_widget.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  TextEditingController code = TextEditingController();
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
                    'Confirmation Code',
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
                  RichText(
                    text: TextSpan(
                      text: "Enter the confirmation code we sent to ",
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioBlack,
                        fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Phone number",
                          style: TextStyle(
                            color: AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.dark
                                ? Colors.white
                                : AppColors.audioBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  AudioTextField(
                    controller: code,
                    hintText: 'Confirmation Code',
                    obsrcure: false,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Didn’t receive the code? ',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.audioBlack,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // http.Response response = await http.post(
                          //   Uri.parse(
                          //       'https://dev.nonicoms.ng/api/v1/auth/resend-token'),
                          //   headers: {
                          //     'Content-Type': 'application/json',
                          //   },
                          //   body: json.encode({
                          //     "phone": userObj.phone,
                          //   }),
                          // );
                          // final data = jsonDecode(response.body);
                          // if (data['ok'] == true) {
                          //   token = data['accessToken'].toString();
                          //   // ignore: use_build_context_synchronously
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           content: Text(
                          //               'Confirmation code resend Successfully')));
                          // } else {
                          //   // ignore: use_build_context_synchronously
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(content: Text(data['message'])));
                          // }
                        },
                        child: const Text(
                          'Resend ',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondaryOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26.0,
                  ),
                  isLoading == false
                      ? PrimaryAudioButton(
                          onTap: () async {
                            // setState(() {
                            //   isLoading = true;
                            // });
                            // http.Response response = await http.post(
                            //   Uri.parse(
                            //       'https://dev.nonicoms.ng/api/v1/auth/verify'),
                            //   headers: {
                            //     'x-token': token,
                            //     'Content-Type': 'application/json',
                            //   },
                            //   body: json.encode({
                            //     "code": code.text,
                            //   }),
                            // );
                            // final data = jsonDecode(response.body);
                            // if (data['ok'] == true) {
                            //   setState(() {
                            //     isLoading = false;
                            //   });
                            //   // ignore: use_build_context_synchronously
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(content: Text(data['message'])));
                            //   // ignore: use_build_context_synchronously
                            //   si.routerService.popReplaceRoute(
                            //       context, const LoginScreen());
                            // } else {
                            //   setState(() {
                            //     isLoading = false;
                            //   });
                            //   // ignore: use_build_context_synchronously
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(content: Text(data['message'])));
                            // }
                          },
                          text: 'Submit',
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  OutlinedPrimaryButton(
                    onTap: () {},
                    text: 'Cancel',
                  ),
                  const SizedBox(
                    height: 26.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
