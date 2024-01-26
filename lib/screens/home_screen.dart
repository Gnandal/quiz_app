import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.startQuiz, {super.key});

  Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              height: 300,
              color: Colors.white70,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Learning Flutter Quickly",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_right_alt,
                  size: 24, color: Colors.white),
              label: const Text(
                "Start",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
