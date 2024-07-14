import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:menu_app/main.dart';

class AppBarHome extends StatefulWidget implements PreferredSizeWidget {
  AppBarHome({super.key}) : preferredSize = Size.fromHeight(30.0);
  @override
  final Size preferredSize;

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> with SingleTickerProviderStateMixin {
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
            right: 20,
            child: ThemeChangeIcon(),
          ),
        ],
      ),
    );
  }
}

class ThemeChangeIcon extends StatefulWidget {
  const ThemeChangeIcon({super.key});

  @override
  State<ThemeChangeIcon> createState() => _ThemeChangeIconState();
}

class _ThemeChangeIconState extends State<ThemeChangeIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLightMode,
      builder: (context, isLight, _) {
        return InkWell(
          onTap: () {
            isLightMode.value = !isLight;
            if (isLightMode.value) {
              _controller.reverse(from: .5);
            } else {
              _controller.animateTo(0.5);
            }
          },
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            width: 70,
            height: 35,
            child: LottieBuilder.asset(
              'assets/animations/theme.json',
              controller: _controller,
            ),
          ),
        );
      },
    );
  }
}
