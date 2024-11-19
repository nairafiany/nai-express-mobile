import 'package:flutter/material.dart';
import 'package:nai_express_mobile/models/product.dart';
import 'package:nai_express_mobile/screens/product_details.dart';
import 'package:nai_express_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    // Ganti URL dengan endpoint API backend Anda
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object Product
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data produk pada nai-express.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail produk
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailPage(
                          name: snapshot.data![index].fields.name,
                          description: snapshot.data![index].fields.description,
                          price: snapshot.data![index].fields.price,
                          stock: snapshot.data![index].fields.stock.toString(),
                          availability:
                              snapshot.data![index].fields.availability,
                          discount: snapshot.data![index].fields.discount,
                          imageUrl:
                              snapshot.data![index].fields.image, // URL gambar
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Menampilkan gambar
                        snapshot.data![index].fields.image.isNotEmpty
                            ? Image.network(
                                snapshot.data![index].fields.image,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : const Text("No Image Available"),
                        const SizedBox(height: 10),
                        Text(
                          "Product Name: ${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            "Description: ${snapshot.data![index].fields.description}"),
                        const SizedBox(height: 10),
                        Text("Price: ${snapshot.data![index].fields.price}"),
                        const SizedBox(height: 10),
                        Text("Stock: ${snapshot.data![index].fields.stock}"),
                        const SizedBox(height: 10),
                        Text(
                            "Availability: ${snapshot.data![index].fields.availability}"),
                        const SizedBox(height: 10),
                        Text(
                            "Discount: ${snapshot.data![index].fields.discount}"),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
