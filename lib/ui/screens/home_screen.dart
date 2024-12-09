import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/company_cubit.dart';
import 'addcompany_screen.dart';
import '../../models/company_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Companies'),
      ),
      body: BlocBuilder<CompanyCubit, List<Company>>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              final Company company = state[index];
              return ListTile(
                title: Text(company.name),
                subtitle:
                    Text('${company.address.street}, ${company.address.city}'),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 0);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_company');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
