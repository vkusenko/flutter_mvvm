import 'package:flutter/material.dart';

class SetupPinScreen extends StatelessWidget {
  const SetupPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup PIN'),
      ),
      body: const Center(
        child: Text('Setup PIN Screen'),
      ),
    );
  }
}
