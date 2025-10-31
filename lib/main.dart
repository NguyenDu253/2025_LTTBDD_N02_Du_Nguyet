import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'add_account_screen.dart';
import 'promo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify-like Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Roboto',
      ),
      // Định nghĩa named routes
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/add_account': (context) => const AddAccountScreen(),
        '/promo': (context) => const PromoScreen(),
      },
    );
  }
}
