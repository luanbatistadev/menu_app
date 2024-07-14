import 'package:flutter/material.dart';
import 'package:menu_app/main.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  AppBarHome({super.key}) : preferredSize = Size.fromHeight(30.0);
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/logo.png',
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'RB Menu',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: ValueListenableBuilder(
              valueListenable: isLightMode,
              builder: (context, isLight, _) {
                return IconButton(
                  icon: Icon(
                    isLight ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    isLightMode.value = !isLight;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
