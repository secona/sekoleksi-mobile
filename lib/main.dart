import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sekoleksi_mobile/screens/home.dart';
import 'package:sekoleksi_mobile/screens/login.dart';
import 'package:sekoleksi_mobile/screens/product_detail.dart';
import 'package:sekoleksi_mobile/screens/product_form.dart';
import 'package:sekoleksi_mobile/screens/product_list.dart';
import 'package:sekoleksi_mobile/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Sekoleksi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/product-detail': (context) => ProductDetailPage(ModalRoute.of(context)?.settings.arguments as String),
          '/product-form': (context) => const ProductFormPage(),
          '/product-list': (context) => const ProductListPage(),
          '/register': (context) => const RegisterPage(),
          '/login': (context) => const LoginPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
