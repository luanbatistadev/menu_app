import 'package:flutter/material.dart';
import 'package:menu_app/components/bottom_nav_bar.dart';
import 'package:menu_app/main.dart';
import 'package:menu_app/pages/cart_page.dart';
import 'package:menu_app/pages/home_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});
  @override
  State createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  Widget build(BuildContext context) {
    return ThemeWidget(
      child: Scaffold(
        body: TabBarView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            CartPage(),
          ],
        ),
        bottomNavigationBar: RBMenuBottomNavigation(
          onTabChange: (index) => navigateBottomBar(index),
        ),
      ),
    );
  }

  void navigateBottomBar(index) {
    _controller.animateTo(index);
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }
}
