import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/navigation_bloc.dart';
import 'package:flutter_application/blocs/navigation_state.dart';
import 'package:flutter_application/screens/educative_card.dart';
import 'package:flutter_application/screens/interactive_process.dart';
import 'package:flutter_application/screens/quiz.dart';
import 'package:flutter_application/theme_provider.dart';
import 'package:flutter_application/widgets/bottom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            home: BlocProvider(
              create: (context) => NavigationBloc(),
              child: HomePage(),
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Widget> _screens = [
    const InteractiveProcess(),
    const EducationCard(),
    const Quiz(),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Excuela Flutter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        actions: [
          const Text(
            'Modo',
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              Switch(
                value: context.watch<ThemeProvider>().isDarkMode,
                onChanged: (value) {
                  context.read<ThemeProvider>().toggleTheme(value);
                },
                activeColor: Colors.white,
              ),
            ],
          )
        ],
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return _screens[state.selectedIndex];
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
