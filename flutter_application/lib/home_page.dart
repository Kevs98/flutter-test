import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application/theme_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  DateTime? _selectedDate;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Date selected 👍'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excuela Test'),
          content: const Text('Esta es una demo del Widget de alertas'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      Center(
        child: ElevatedButton(
          onPressed: _showAlertDialog,
          child: const Text('Mostrar Alerta'),
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _selectedDate == null
                  ? 'Sin Fecha Seleccionada'
                  : 'Fecha Seleccionada: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Seleccionar Fecha'),
            ),
          ],
        ),
      ),
      Center(
        child: SizedBox(
          width: 400,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kevin Estrada',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Fullstack Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This is a demo of a flutter app with some functional widget developed by me',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Image.asset(
                            'assets/icons/github-mark.png',
                            width: 32,
                            height: 32,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () async {
                            const url = 'https://github.com/Kevs98';

                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              print('bad url');
                            }
                          }),
                      IconButton(
                          icon: Image.asset(
                            'assets/icons/linkedin.png',
                            width: 32,
                            height: 32,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () async {
                            const url = 'https://www.linkedin.com/in/kevin-estrada-2a1403189/';

                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              print('bad url');
                            }
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Excuela Demo',
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
      body: (_selectedIndex == 0 && Platform.isWindows)
          ? const Center(
              child: Text(
                'This feature is not supported on Windows. Please use a mobile device.',
                textAlign: TextAlign.center,
              ),
            )
          : widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Alerta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Tarjeta',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
