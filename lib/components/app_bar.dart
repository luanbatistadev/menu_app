import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarHome({super.key})
      : preferredSize = Size.fromHeight(30.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(              
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/logo.png',
                height: 30,
                width: 30,
              ),
              SizedBox(width: 8),
              Text(
                'Chicken Republic',
                style: TextStyle(
                  color: Color.fromARGB(255, 5, 12, 112),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,                  
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'EN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color.fromARGB(255, 5, 12, 112),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
