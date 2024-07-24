import 'package:abook/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.author,
    required this.image,
  });
  final String image;
  final String author;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160.0,
            width: 160.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            author,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? Colors.white
                  : AppColors.audioBlack,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
          Text(
            '1000+ Listeners',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? Colors.white
                  : AppColors.audioGrey,
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
