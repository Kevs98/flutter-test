import 'package:flutter/material.dart';
import 'package:flutter_application/home_page.dart';
import 'package:flutter_application/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Excuela',
            theme: ThemeData(
              fontFamily: 'Poppins',
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              fontFamily: 'Poppins',
              brightness: Brightness.dark,
            ),
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
