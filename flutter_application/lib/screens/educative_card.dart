import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print('Could not launch $url');
                          }
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
