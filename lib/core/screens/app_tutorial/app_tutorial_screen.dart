import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('AppTutorialScreen'),
      ),
    );
  }
}
