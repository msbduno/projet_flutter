import 'package:flutter/material.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/add_company_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/add_company': (context) => AddCompany(),
      },
    );
  }
}