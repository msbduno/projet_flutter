import 'package:flutter/material.dart';
import '../../models/company_model.dart';
import 'add_company_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final List<Company> _companies = const [
    Company('Entreprise 1'),
    Company('Entreprise 2'),
    Company('Entreprise 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text('Liste des entreprises'),
      ),
      body: ListView.builder(
        itemCount: _companies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_companies[index].name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCompany()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}