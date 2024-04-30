import 'package:abook/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class BestSellerCard extends StatelessWidget {
  const BestSellerCard({
    super.key,
    required this.author,
    required this.img,
    required this.rating,
    required this.title,
  });
  final String img;
  final String author;
  final String title;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 70.w,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
            ? AppColors.audioBlack
            : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 120.0,
            width: 100.0,
            fit: BoxFit.contain,
            image: NetworkImage(
              img,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
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
              Text(
                author,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? const Color(0xFFEBEBF5)
                          : const Color(0xFF6A6A8B),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
                child: RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  ignoreGestures: true,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: AppColors.secondaryOrange,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                '1,000+ Listeners',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                          ? const Color(0xFFEBEBF5)
                          : const Color(0xFF6A6A8B),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
