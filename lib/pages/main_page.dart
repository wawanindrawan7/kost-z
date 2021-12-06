import 'package:flutter/material.dart';
import 'package:kost_z/pages/bookmark_page.dart';
import 'package:kost_z/pages/home_page.dart';
import 'package:kost_z/pages/search_page.dart';
import 'package:kost_z/pages/setting_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main_page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavBarIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    BookmarkPage(),
    SettingPage(),
  ];

  List<SalomonBottomBarItem> _bottomNavBarItems = [
    SalomonBottomBarItem(
      icon: Icon(Icons.home_rounded),
      title: Text('Home'),
      selectedColor: Colors.purple,
    ),
    SalomonBottomBarItem(
      icon: Icon(Icons.search_rounded),
      title: Text('Search'),
      selectedColor: Colors.purple,
    ),
    SalomonBottomBarItem(
      icon: Icon(Icons.book_rounded),
      title: Text('Bookmark'),
      selectedColor: Colors.purple,
    ),
    SalomonBottomBarItem(
      icon: Icon(Icons.settings),
      title: Text('Setting'),
      selectedColor: Colors.purple,
    ),
  ];

  void _onTapped(int index) {
    setState(() {
      _bottomNavBarIndex = index;
    });
  }

  Widget buildBottomNavBar(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavBarIndex],
      bottomNavigationBar: SalomonBottomBar(
        items: _bottomNavBarItems,
        currentIndex: _bottomNavBarIndex,
        onTap: _onTapped,
        itemPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        unselectedItemColor: Colors.grey.shade500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBottomNavBar(context);
  }
}
