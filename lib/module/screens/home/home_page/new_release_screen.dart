import 'package:abook/data/models/book_model.dart';
import 'package:abook/index.dart';
import 'package:abook/shared/widgets/cards/new_release_card.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class NewReleaseScreen extends StatefulWidget {
  const NewReleaseScreen({super.key, required this.books});

  final List<BookModel> books;

  @override
  State<NewReleaseScreen> createState() => _NewReleaseScreenState();
}

class _NewReleaseScreenState extends State<NewReleaseScreen> {
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
          'New Release',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: widget.books.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        NewReleaseCard(
                          author: widget.books[index].author,
                          image: widget.books[index].coverImageUrl,
                        ),
                        Text(
                          'E.A James,',
                          style: TextStyle(
                            color: AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.dark
                                ? Colors.white
                                : AppColors.primaryPurple,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
