import 'package:abook/index.dart';
import 'package:abook/shared/global/constants.dart';
import 'package:abook/shared/widgets/cards/trending_card.dart';
import 'package:abook/shared/widgets/forms/audio_text_field.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? const Image(
                              image: AssetImage('assets/svg/logo2.png'),
                            )
                          : const Image(
                              image: AssetImage('assets/svg/logo.jpg'),
                            ),
                      RichText(
                        text: TextSpan(
                          text: "Audio",
                          style: TextStyle(
                            color: AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.dark
                                ? Colors.white
                                : AppColors.primaryPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Books",
                              style: TextStyle(
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.dark
                                    ? Colors.white
                                    : AppColors.primaryPurple,
                                fontWeight: FontWeight.w300,
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person_2_outlined,
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : const Color(0xFF200E32),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45.0,
              ),
              Text(
                'Explore',
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              AudioTextField(
                controller: search,
                hintText: 'Search Books or Authors..',
                obsrcure: false,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 35.0,
              ),
              Text(
                'Recommended Categories',
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecommendCard(
                    icon: Icons.business_outlined,
                    text: 'Bussiness',
                  ),
                  RecommendCard(
                    icon: Icons.person_outlined,
                    text: 'Personal',
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecommendCard(
                    icon: Icons.my_library_music_outlined,
                    text: 'Music',
                  ),
                  RecommendCard(
                    icon: Icons.camera_alt_outlined,
                    text: 'Photography',
                  ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Latest Search',
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 25.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: authors.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15.0,
                        ),
                    itemBuilder: (context, index) {
                      return TrendingCard(
                        author: trendAuthors[index],
                        image: dummyTrend[index],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendCard extends StatelessWidget {
  const RecommendCard({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 48.0,
        width: 42.w,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
              ? AppColors.faintDark
              : const Color(0xFFF5F5FA),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? Colors.white
                    : AppColors.audioBlack,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
