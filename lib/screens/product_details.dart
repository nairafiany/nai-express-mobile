import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String stock;
  final String availability;
  final String discount;
  final String imageUrl; // URL gambar (jika ada)

  const ItemDetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.availability,
    required this.discount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilkan gambar jika ada
            imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Center(child: Text("No Image Available")),
                  ),
            const SizedBox(height: 16),
            Text(
              "Name: $name",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Description: $description"),
            const SizedBox(height: 8),
            Text("Price: $price"),
            const SizedBox(height: 8),
            Text("Stock: $stock"),
            const SizedBox(height: 8),
            Text("Availability: $availability"),
            const SizedBox(height: 8),
            Text("Discount: $discount"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali ke Daftar Produk"),
            ),
          ],
        ),
      ),
    );
  }
}
