import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/components/bottom_nav_bar.dart';
import 'package:menu_app/pages/cart_page.dart';
import 'package:menu_app/pages/home_page.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
  @override
  State createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final List<Widget> _pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    CartPage(),
  ];

  final List _appbar = [
    AppBarHome(),
    null,
  ];

  int _selectedIndex = 0;
  int hasAppBar = 0;

  void navigateBottomBar(index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) {
        hasAppBar = 1;
      } else {
        hasAppBar = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar[hasAppBar],
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyAppBottomNavigation(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
