import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp/ui/screens/searchAddress_screen.dart';
import 'blocs/company_cubit.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/addcompany_screen.dart';

void main() {

  // Pour pouvoir utiliser les SharePreferences avant le runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Instanciation du Cubit
  final CompanyCubit companyCubit = CompanyCubit();

  // Chargement des entreprises
  companyCubit.loadCompanies();

  runApp(
      BlocProvider<CompanyCubit>(
        create: (_) => companyCubit,
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projet Flutter ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/add_company': (context) => AddCompany(),
        '/search_address': (context) => const SearchAddress(),
      },
    );
  }
}