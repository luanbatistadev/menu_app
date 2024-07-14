import 'package:flutter/material.dart';
import 'package:menu_app/models/cart.dart';
import 'package:provider/provider.dart';

class MyAppBottomNavigation extends StatefulWidget {
  const MyAppBottomNavigation({super.key, required this.onTabChange});
  final void Function(int)? onTabChange;

  @override
  State<MyAppBottomNavigation> createState() => _MyAppBottomNavigationState();
}

class _MyAppBottomNavigationState extends State<MyAppBottomNavigation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
          widget.onTabChange!(value);
        },
        currentIndex: index,
        iconSize: 32,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                AnimatedPadding(
                  duration: Duration(milliseconds: 300),
                  padding: cart.getCartLength() == 0
                      ? EdgeInsets.zero
                      : EdgeInsets.only(top: 12, right: 12),
                  child: Icon(Icons.shopping_cart),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: AnimatedScale(
                    scale: cart.getCartLength() == 0 ? 0 : 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 5, 12, 112),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: Text(
                        '${cart.getCartLength()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Carrinho',
          ),
        ],
      ),
    );
  }
}
