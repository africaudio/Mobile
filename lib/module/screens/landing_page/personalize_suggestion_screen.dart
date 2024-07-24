import 'package:abook/data/providers/personalize_provider.dart';
import 'package:abook/index.dart';
import 'package:abook/module/screens/landing_page/ready_to_go_screen.dart';
import 'package:abook/shared/widgets/buttons/outlined_button.dart';
import 'package:abook/shared/widgets/buttons/primary_button.dart';
import 'package:abook/shared/widgets/forms/audio_text_field.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PersonalizeSuggestionScreen extends StatefulWidget {
  const PersonalizeSuggestionScreen({super.key});

  @override
  State<PersonalizeSuggestionScreen> createState() =>
      _PersonalizeSuggestionScreenState();
}

class _PersonalizeSuggestionScreenState
    extends State<PersonalizeSuggestionScreen> {
  List<String> dummyCategory = [
    'Art',
    'Business',
    'Biography',
    'Comedy',
    'Culture',
    'Education',
    'News',
    'Physiology',
    'Psychology',
    'Technology',
    'Travel'
  ];

  String recentAction = '';
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Consumer<PersonalizeProvide>(builder: (_, state, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personalize Suggestion',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioBlack,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                RichText(
                  text: TextSpan(
                    text: "Choose  ",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioBlack,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "min. 3 topics ",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.dark
                                ? Colors.white
                                : AppColors.audioBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      TextSpan(
                        text:
                            "you like, we will give you more often that relate to it.",
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? Colors.white
                              : AppColors.audioBlack,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const AudioTextField(
                  hintText: 'Search Categories',
                  obsrcure: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 25.h,
                  child: GridView.builder(
                    itemCount: 11,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                            recentAction = dummyCategory[index];
                          });
                          state.addSuggestion(recentAction);
                        },
                        child: Container(
                          height: 30.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? Colors.white
                                  : AppColors.primaryPurple,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Center(
                            child: Text(dummyCategory[index],
                                style: TextStyle(
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.dark
                                      ? Colors.white
                                      : AppColors.primaryPurple,
                                  fontSize: 14,
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  '${state.selectedPersonalize.length} topics selected',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.primaryPurple,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                PrimaryAudioButton(
                  onTap: () {},
                  text: 'Submit',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                OutlinedPrimaryButton(
                  onTap: () {
                    si.routerService
                        .popReplaceRoute(context, const ReadyToGoScreen());
                  },
                  text: 'Skip',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
