import 'package:flutter/material.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/pages/base_page.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {  

  @override
  Widget build(BuildContext context) {  

    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.lexend(textStyle: textTheme.bodyMedium),
        ),
      ),
        debugShowCheckedModeBanner: false,
        home: BasePage(),
      ),
    );
  }
}
