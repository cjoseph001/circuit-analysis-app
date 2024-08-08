import 'package:flutter/material.dart';
import 'rc_page.dart';
import 'rl_page.dart';
import 'rlc_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/rlPage': (context) => const RLPage(),
        '/rcPage': (context) => const RCPage(),
        '/rlcPage': (context) => const RLCPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  Widget buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFF00055F),
        backgroundColor: Colors.lightBlue[100],
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: Color(0xFF00055F),
            width: 1.5,
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(7.5), // Add padding here
        width: 230,
        height: 100,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17.5,
            fontWeight: FontWeight.bold, // Adjust the font weight if needed
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC3E1EE),
      appBar: AppBar(
        title: const Text('Circuit Analysis App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose a Problem',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00055F),
              ),
            ),
            const SizedBox(height: 70),
            buildButton('AC Source-Series RLC Circuit', () {
              Navigator.pushNamed(context, '/rlcPage');
            }),
            const SizedBox(height: 40),
            buildButton('DC Source-Series RC Circuit', () {
              Navigator.pushNamed(context, '/rcPage');
            }),
            const SizedBox(height: 40),
            buildButton('DC Source-Series RL Circuit', () {
              Navigator.pushNamed(context, '/rlPage');
            }),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
