import 'package:flutter/material.dart';
import 'package:nai_express_mobile/screens/login.dart';
import 'package:nai_express_mobile/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Nai Express Mobile',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            primary: Colors.blue[900], // Menggunakan blue 900
            secondary: Colors.blue[800], // Menggunakan blue 800
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
