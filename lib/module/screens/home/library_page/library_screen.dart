import 'package:abook/index.dart';
import 'package:abook/shared/global/constants.dart';
import 'package:abook/shared/widgets/forms/audio_text_field.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
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
                    onPressed: () {
                      AdaptiveTheme.of(context).toggleThemeMode();
                    },
                    icon: Icon(
                      Icons.settings_outlined,
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
                'My Books',
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
                height: 20.0,
              ),
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                  itemCount: authors.length,
                  itemBuilder: (context, index) {
                    return LibraryCard(
                      image: dummyTrend[index],
                      book: trendAuthors[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    super.key,
    required this.book,
    required this.image,
  });
  final String image;
  final String book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.0,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        children: [
          Image(
            height: 80.0,
            width: 80.0,
            fit: BoxFit.fill,
            image: NetworkImage(
              image,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Fifty Shades Trilogy',
                  overflow: TextOverflow.ellipsis,
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
                  height: 6.0,
                ),
                Text(
                  book,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
