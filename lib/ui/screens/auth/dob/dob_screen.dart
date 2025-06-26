import 'package:flutter/material.dart';

class DobScreen extends StatelessWidget {
  const DobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date of Birth'),
      ),
      body: const Center(
        child: Text('Date of Birth Screen'),
      ),
    );
  }
}
