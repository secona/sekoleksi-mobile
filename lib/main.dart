import 'package:flutter/material.dart';
import 'package:sekoleksi_mobile/screens/home.dart';
import 'package:sekoleksi_mobile/screens/product_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/product-form': (context) => const ProductFormPage(),
      }
    );
  }
}
