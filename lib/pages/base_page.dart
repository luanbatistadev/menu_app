import 'package:flutter/material.dart';
import 'package:menu_app/components/bottom_nav_bar.dart';
import 'package:menu_app/pages/cart_page.dart';
import 'package:menu_app/pages/home_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});
  @override
  State createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final List<Widget> _pages = [
    HomePage(),
    CartPage(),
  ];

  int _selectedIndex = 0;

  void navigateBottomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages[_selectedIndex],
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: MyAppBottomNavigation(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
