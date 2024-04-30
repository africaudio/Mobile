import 'package:abook/data/models/book_model.dart';
import 'package:abook/index.dart';
import 'package:abook/module/screens/home/player_page/player_screen.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.book});

  final BookModel book;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
          widget.book.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? Colors.white
                : const Color(0xFF2E2E5D),
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
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Image(
                    height: 260.0,
                    width: 260.0,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      widget.book.coverImageUrl,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  widget.book.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.book.author,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? const Color(0xFFEBEBF5)
                            : const Color(0xFF9292A2),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 25.0,
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        ignoreGestures: true,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColors.secondaryOrange,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '0.0',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? const Color(0xFFD5D5E3)
                              : const Color(0xFF9292A2),
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  height: 35.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GenreCard(
                        name: widget.book.categories[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.w,
                      );
                    },
                    itemCount: widget.book.categories.length,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        url = widget.book.audioSampleUrl;
                        si.routerService.nextRoute(
                            context,
                            PlayerScreen(
                              selectedBook: widget.book,
                            ));
                      },
                      child: Container(
                        height: 53.0,
                        width: 40.w,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: AppColors.primaryPurple,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_circle_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              'Play Audio',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 53.0,
                      width: 40.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.dark
                              ? Colors.white
                              : AppColors.primaryPurple,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.money_outlined,
                            color: AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.dark
                                ? Colors.white
                                : AppColors.primaryPurple,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            'Buy Now',
                            style: TextStyle(
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? Colors.white
                                  : AppColors.primaryPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Summary',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  widget.book.description,
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? const Color(0xFFD5D5E3)
                            : const Color(0xFF6A6A8B),
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                  ),
                ),
                // const SizedBox(
                //   height: 20.0,
                // ),
                // Text(
                //   'In an interview with Salon, several dominatrices have responded that while submission can be an escape from daily stresses, they also frequently have male clients and that trust is a big factor in dominant/submissive relationships. One interviewed former dominatrix and author, Melissa Febos, stated that even if the book\'s popularity was a result of women\'s current anxieties about equality that it doesn\'t mean that it\'s evidence of unhappiness, or an invalidation of feminism.',
                //   style: TextStyle(
                //     color:
                //         AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                //             ? const Color(0xFFD5D5E3)
                //             : const Color(0xFF6A6A8B),
                //     fontWeight: FontWeight.w300,
                //     fontSize: 14.0,
                //   ),
                // ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Reviews',
                  style: TextStyle(
                    color:
                        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                            ? Colors.white
                            : AppColors.audioBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                // SizedBox(
                //   height: 14.h,
                //   child: PageView.builder(
                //     itemCount: widget.book.reviews.length,
                //     itemBuilder: (context, index) {
                //       return Column(
                //         children: [
                //           Row(
                //             children: [
                //               Container(
                //                 height: 48.0,
                //                 width: 48.0,
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(8.0),
                //                     image: const DecorationImage(
                //                       fit: BoxFit.fill,
                //                       image: NetworkImage(
                //                           'https://images.gr-assets.com/authors/1549477398p8/4725841.jpg'),
                //                     )),
                //               ),
                //               const SizedBox(
                //                 width: 20.0,
                //               ),
                //               Expanded(
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       widget.book.reviews[index].user,
                //                       style: TextStyle(
                //                         color: AdaptiveTheme.of(context).mode ==
                //                                 AdaptiveThemeMode.dark
                //                             ? Colors.white
                //                             : AppColors.audioBlack,
                //                         fontWeight: FontWeight.w500,
                //                         fontSize: 14.0,
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height: 15.0,
                //                       child: Row(
                //                         children: [
                //                           RatingBar.builder(
                //                             initialRating: double.parse(widget
                //                                 .book.reviews[index].rating
                //                                 .toString()),
                //                             minRating: 1,
                //                             ignoreGestures: true,
                //                             itemSize: 15.0,
                //                             direction: Axis.horizontal,
                //                             allowHalfRating: false,
                //                             itemCount: 5,
                //                             itemPadding:
                //                                 const EdgeInsets.symmetric(
                //                                     horizontal: 4.0),
                //                             itemBuilder: (context, _) =>
                //                                 const Icon(
                //                               Icons.star,
                //                               color: AppColors.secondaryOrange,
                //                             ),
                //                             onRatingUpdate: (rating) {},
                //                           ),
                //                           const SizedBox(
                //                             width: 4.0,
                //                           ),
                //                           Text(
                //                             widget.book.reviews[index].createdAt
                //                                 .toIso8601String(),
                //                             overflow: TextOverflow.ellipsis,
                //                             textAlign: TextAlign.left,
                //                             style: TextStyle(
                //                               color: AdaptiveTheme.of(context)
                //                                           .mode ==
                //                                       AdaptiveThemeMode.dark
                //                                   ? const Color(0xFFD5D5E3)
                //                                   : const Color(0xFF9292A2),
                //                               fontWeight: FontWeight.w400,
                //                               fontSize: 10.0,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //           const SizedBox(
                //             height: 15.0,
                //           ),
                //           Text(
                //             widget.book.reviews[index].text,
                //             style: TextStyle(
                //               color: AdaptiveTheme.of(context).mode ==
                //                       AdaptiveThemeMode.dark
                //                   ? const Color(0xFFD5D5E3)
                //                   : const Color(0xFF6A6A8B),
                //               fontWeight: FontWeight.w300,
                //               fontSize: 14.0,
                //             ),
                //           ),
                //         ],
                //       );
                //     },
                //   ),
                // ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primaryPurple,
                      radius: 8.0,
                    ),
                    Text(
                      'View More',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.secondaryOrange,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 85.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
              ? Colors.white
              : const Color(0xFF6A6A8B),
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? Colors.white
                : const Color(0xFF6A6A8B),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
