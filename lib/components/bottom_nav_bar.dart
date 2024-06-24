import 'package:flutter/material.dart';

class BottomNavBarHome extends StatelessWidget {
  const BottomNavBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Reservation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Cart',
        ),
      ],
      selectedItemColor: Color.fromARGB(255, 5, 12, 112),
      unselectedItemColor: Colors.black54,
    );
  }
}
