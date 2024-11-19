import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:nai_express_mobile/screens/menu.dart';
import 'package:nai_express_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class AddProductFormPage extends StatefulWidget {
  const AddProductFormPage({super.key});

  @override
  State<AddProductFormPage> createState() => _AddProductFormPageState();
}

class _AddProductFormPageState extends State<AddProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _stock = 0;
  String _description = "";
  double _price = 0.0;
  String _availability = "In Stock";
  double _discount = 0.0;
  String? _imageBase64; // Untuk menyimpan data gambar dalam Base64

  Future<void> _pickImage() async {
    final html.FileUploadInputElement uploadInput =
        html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final reader = html.FileReader();
        reader.readAsDataUrl(files[0]);

        reader.onLoadEnd.listen((e) {
          setState(() {
            _imageBase64 = reader.result as String;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Form Tambah Produk'),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: "Name",
                hint: "Product Name",
                onChanged: (value) => _name = value ?? "",
                validator: (value) => value == null || value.isEmpty
                    ? "Name tidak boleh kosong!"
                    : null,
              ),
              _buildTextField(
                label: "Stock",
                hint: "Available Stock",
                keyboardType: TextInputType.number,
                onChanged: (value) => _stock = int.tryParse(value ?? "0") ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Stock tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Stock harus berupa angka!";
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: "Description",
                hint: "Product Description",
                onChanged: (value) => _description = value ?? "",
                validator: (value) => value == null || value.isEmpty
                    ? "Description tidak boleh kosong!"
                    : null,
              ),
              _buildTextField(
                label: "Price",
                hint: "Product Price",
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    _price = double.tryParse(value ?? "0.0") ?? 0.0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Price tidak boleh kosong!";
                  }
                  if (double.tryParse(value) == null) {
                    return "Price harus berupa angka!";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: _availability,
                  decoration: InputDecoration(
                    labelText: "Availability",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: "In Stock", child: Text("In Stock")),
                    DropdownMenuItem(
                        value: "Out of Stock", child: Text("Out of Stock")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _availability = value ?? "In Stock";
                    });
                  },
                ),
              ),
              _buildTextField(
                label: "Discount",
                hint: "Product Discount",
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    _discount = double.tryParse(value ?? "0.0") ?? 0.0,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Discount tidak boleh kosong!";
                  }
                  if (double.tryParse(value) == null) {
                    return "Discount harus berupa angka!";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text("Upload Image"),
                    ),
                    const SizedBox(width: 16),
                    _imageBase64 == null
                        ? const Text("No image selected")
                        : Image.network(
                            _imageBase64!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/",
                          jsonEncode(<String, dynamic>{
                            'name': _name,
                            'stock': _stock.toString(),
                            'description': _description,
                            'price': _price.toString(),
                            'availability': _availability,
                            'discount': _discount.toString(),
                            'image': _imageBase64 ?? "",
                          }),
                        );

                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Produk baru berhasil disimpan!"),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Terdapat kesalahan, silakan coba lagi."),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    required Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
