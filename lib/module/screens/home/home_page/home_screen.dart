import 'package:abook/data/models/book_model.dart';
import 'package:abook/index.dart';
import 'package:abook/module/screens/home/home_page/details_screen.dart';
import 'package:abook/module/screens/home/home_page/new_release_screen.dart';
import 'package:abook/module/screens/home/setting_page/setting_screen.dart';
import 'package:abook/shared/global/all.dart';
import 'package:abook/shared/widgets/cards/best_seller_card.dart';
import 'package:abook/shared/widgets/cards/new_release_card.dart';
import 'package:abook/shared/widgets/cards/trending_card.dart';
import 'package:abook/shared/widgets/forms/logo_widget.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<BookModel>>? allBooks;
  const HomeScreen({super.key, required this.allBooks});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<BookModel>>? newAllBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? AppColors.darkbgColor
          : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async {
              newAllBooks = si.bookService.allBooks(limit: 2, page: 1);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const LogoWidget(
                            height: 40.0,
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
                          // AdaptiveTheme.of(context).toggleThemeMode();
                          si.routerService
                              .nextRoute(context, const SettingScreen());
                        },
                        icon: Icon(
                          Icons.person_outline,
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
                    'Categories',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
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
                    height: 45.0,
                    child: ListView.builder(
                        itemCount: category.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 40.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.dark
                                  ? AppColors.audioBlack
                                  : AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: Text(
                                category[index],
                                style: TextStyle(
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.dark
                                      ? Colors.white
                                      : AppColors.audioBlack,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Recommended For You',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  FutureBuilder(
                      future: newAllBooks ?? widget.allBooks,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: SpinKitWave(
                              color: Colors.orange,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (!snapshot.hasData) {
                          return const Center(child: Text('NO DATA!'));
                        } else if (snapshot.hasData) {
                          return SizedBox(
                            height: 305.0,
                            child: ListView.separated(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      si.routerService.nextRoute(
                                          context,
                                          DetailsScreen(
                                            book: snapshot.data![index],
                                          ));
                                    },
                                    child: Image(
                                      height: 300.0,
                                      width: 200.0,
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        snapshot.data![index].coverImageUrl,
                                      ),
                                    ),
                                  );
                                }),
                          );
                        } else {
                          return Container();
                        }
                      }),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Best Seller',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  FutureBuilder(
                      future: widget.allBooks,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: SpinKitWave(
                              color: Colors.orange,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (!snapshot.hasData) {
                          return const Center(child: Text('NO DATA!'));
                        } else if (snapshot.hasData) {
                          return SizedBox(
                            height: 155.0,
                            child: ListView.separated(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      si.routerService.nextRoute(
                                          context,
                                          DetailsScreen(
                                            book: snapshot.data![index],
                                          ));
                                    },
                                    child: BestSellerCard(
                                      author: snapshot.data![index].author,
                                      img: snapshot.data![index].coverImageUrl,
                                      rating: 0.0,
                                      title: snapshot.data![index].title,
                                    ),
                                  );
                                }),
                          );
                        } else {
                          return Container();
                        }
                      }),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FutureBuilder(
                      future: widget.allBooks,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: SpinKitWave(
                              color: Colors.orange,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (!snapshot.hasData) {
                          return const Center(child: Text('NO DATA!'));
                        } else if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  si.routerService.nextRoute(
                                      context,
                                      NewReleaseScreen(
                                        books: snapshot.data!,
                                      ));
                                },
                                child: Text(
                                  'New Release',
                                  style: TextStyle(
                                    color: AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.dark
                                        ? Colors.white
                                        : AppColors.audioBlack,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: 220,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          si.routerService.nextRoute(
                                            context,
                                            DetailsScreen(
                                              book: snapshot.data![index],
                                            ),
                                          );
                                        },
                                        child: NewReleaseCard(
                                          author: snapshot.data![index].author,
                                          image: snapshot
                                              .data![index].coverImageUrl,
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Treanding Now',
                    style: TextStyle(
                      color: AdaptiveTheme.of(context).mode ==
                              AdaptiveThemeMode.dark
                          ? Colors.white
                          : AppColors.audioBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  FutureBuilder(
                      future: widget.allBooks,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: SpinKitWave(
                              color: Colors.orange,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (!snapshot.hasData) {
                          return const Center(child: Text('NO DATA!'));
                        } else if (snapshot.hasData) {
                          return SizedBox(
                            height: 220,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      si.routerService.nextRoute(
                                          context,
                                          DetailsScreen(
                                            book: snapshot.data![index],
                                          ));
                                    },
                                    child: TrendingCard(
                                      author: snapshot.data![index].author,
                                      image:
                                          snapshot.data![index].coverImageUrl,
                                    ),
                                  );
                                }),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
