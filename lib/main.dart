import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/pages/base_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(RBMenuApp());
}

class RBMenuApp extends StatefulWidget {
  const RBMenuApp({super.key});

  @override
  State<RBMenuApp> createState() => _RBMenuAppState();
}

class _RBMenuAppState extends State<RBMenuApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BasePage(),
      ),
    );
  }
}

ValueNotifier isLightMode = ValueNotifier<bool>(true);

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ValueListenableBuilder(
      valueListenable: isLightMode,
      builder: (context, isLight, child) {
        return AnimatedTheme(
          data: isLight
              ? ThemeData.light().copyWith(
                  scaffoldBackgroundColor: Colors.white,
                  textTheme: GoogleFonts.lexendTextTheme(textTheme).copyWith(
                    titleLarge: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      color: Color.fromARGB(255, 5, 12, 112),
                    ),
                    titleMedium: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      color: Color.fromARGB(255, 5, 12, 112),
                    ),
                    bodyMedium: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    bodySmall: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    bodyLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    titleSmall: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    labelSmall: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  colorScheme: const ColorScheme.light().copyWith(
                    primary: Color.fromARGB(255, 5, 12, 112),
                    secondary: Color.fromARGB(255, 5, 12, 112),
                    surface: Colors.white,
                    primaryContainer: Colors.white,
                  ),
                  tabBarTheme: TabBarTheme(
                    labelColor: Color.fromARGB(255, 5, 12, 112),
                  ),
                )
              : ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: Color(0xff1E1D24),
                  textTheme: GoogleFonts.lexendTextTheme(textTheme).copyWith(
                    titleLarge: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    titleSmall: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    titleMedium: GoogleFonts.lexend(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    bodyMedium: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    bodySmall: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                    bodyLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    labelSmall: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  colorScheme: const ColorScheme.dark().copyWith(
                    onSurface: Color(0xff1E1D24),
                    secondary: Color.fromARGB(255, 5, 12, 112),
                    primary: Colors.white,
                    primaryContainer: Color(0xff1E1D24),
                  ),
                  tabBarTheme: TabBarTheme(
                    labelColor: Colors.white,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white.withOpacity(.6),
                  ),
                ),
          duration: Duration(milliseconds: 300),
          child: child!,
        );
      },
      child: child,
    );
  }
}
