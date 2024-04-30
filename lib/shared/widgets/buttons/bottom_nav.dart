import 'package:abook/core/injector/injector.dart';
import 'package:abook/data/models/book_model.dart';
import 'package:abook/module/screens/home/home.dart';
import 'package:abook/module/screens/home/library_page/library_screen.dart';
import 'package:abook/shared/shared.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late PageController tabController;
  static Future<List<BookModel>>? allBooks;
  @override
  void initState() {
    super.initState();
    tabController = PageController();
    allBooks = si.bookService.allBooks(limit: 2, page: 1);
  }

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(allBooks: allBooks),
    const SearchScreen(),
    const LibraryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _widgetOptions.elementAt(_selectedIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? Colors.white
                : AppColors.primaryPurple,
        unselectedItemColor: AppColors.audioGrey,
        showUnselectedLabels: true,
        backgroundColor:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? AppColors.audioBlack
                : AppColors.cardBackground,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
