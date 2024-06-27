import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyAppBottomNavigation extends StatelessWidget {
  final void Function(int)? onTabChange;

  const MyAppBottomNavigation({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20),),),
      child: GNav(
          iconSize: 28,
          activeColor: Color.fromARGB(255, 5, 12, 112),
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.calendar_month_outlined,
              text: 'Reserve',
            ),
            GButton(
              icon: Icons.shopping_cart_outlined,
              text: 'Cart',
            ),
          ],),
    );
  }
}
