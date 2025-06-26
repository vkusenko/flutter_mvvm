import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
      ),
      body: const Center(
        child: Text('Phone Number Screen'),
      ),
    );
  }
}
