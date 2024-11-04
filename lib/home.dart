import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String npm = '2306152411';
  final String name = 'Muhammad Vito Secona';
  final String className = 'PBP F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sekoleksi"),
      ),
    );
  }
}
