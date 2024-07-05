import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:menu_app/models/cart.dart';
import 'package:provider/provider.dart';

class MyAppBottomNavigation extends StatefulWidget {
  final void Function(int)? onTabChange;

  const MyAppBottomNavigation({super.key, required this.onTabChange});

  @override
  State<MyAppBottomNavigation> createState() => _MyAppBottomNavigationState();
}

class _MyAppBottomNavigationState extends State<MyAppBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Consumer<Cart>(
      builder: (context, cart, child) => Stack(
        children: [
          GNav(
            iconSize: 25,
            activeColor: Color.fromARGB(255, 5, 12, 112),
            onTabChange: (index) => setState(() {
              widget.onTabChange!(index);
              index == 0 ? index++ : index += 0;
            }),
            selectedIndex: index,
            mainAxisAlignment: MainAxisAlignment.center,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                iconActiveColor: Color.fromARGB(255, 5, 12, 112),
                text: 'Cart',
              ),
            ],
          ),
          cart.getCartLength() > 0
              ? Positioned(
                  bottom: 25,
                  right: 110,
                  child: Text(
                    '${cart.getCartLength()}',
                    style: TextStyle(
                      color: index != 0
                          ? Color.fromARGB(255, 5, 12, 112)
                          : Colors.grey[900],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : SizedBox(
                  height: 0,
                  width: 0,
                ),
        ],
      ),
    );
  }
}
