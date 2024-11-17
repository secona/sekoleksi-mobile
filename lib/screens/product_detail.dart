import 'package:flutter/material.dart';
import 'package:sekoleksi_mobile/models/product.dart';
import 'package:sekoleksi_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;

  const ProductDetailPage(this.id, {super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Future<Product> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/${widget.id}');
    return Product.fromJson(response[0]);
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot<Product> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text('Belum ada produk.'),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.fields.name,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("${snapshot.data!.fields.price}"),
                            const SizedBox(height: 10),
                            Text(snapshot.data!.fields.description),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      child: const Text('Back'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}

