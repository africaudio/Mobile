import 'package:abook/index.dart';
import 'package:abook/module/screens/landing_page/personalize_suggestion_screen.dart';
import 'package:abook/shared/widgets/buttons/outlined_button.dart';
import 'package:abook/shared/widgets/buttons/primary_button.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeHomeScreen extends StatefulWidget {
  const WelcomeHomeScreen({super.key});

  @override
  State<WelcomeHomeScreen> createState() => _WelcomeHomeScreenState();
}

class _WelcomeHomeScreenState extends State<WelcomeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome !',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? const Color.fromARGB(255, 129, 116, 243)
                              .withOpacity(0.9)
                          : AppColors.secondaryOrange,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Find what you are looking for',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 48,
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.primaryPurple,
                    fontWeight: FontWeight.w100,
                    wordSpacing: 8.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'By personalize your account, we can help you to find what you like.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? const Color.fromARGB(255, 129, 116, 243)
                                .withOpacity(0.9)
                            : AppColors.audioBlack,
                  ),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              PrimaryAudioButton(
                  onTap: () {
                    si.routerService.popReplaceRoute(
                        context, const PersonalizeSuggestionScreen());
                  },
                  text: 'Personalize Your Account'),
              const SizedBox(
                height: 16.0,
              ),
              OutlinedPrimaryButton(onTap: () {}, text: 'Skip'),
            ],
          ),
        ),
      ),
    );
  }
}
