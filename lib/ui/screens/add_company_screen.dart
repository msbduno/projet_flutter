import 'package:flutter/material.dart';

import '../../models/company_model.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Add Company'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  labelText: 'Nom de l’entreprise',
                  prefixIcon: Icon(Icons.business),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  final String name = _textFieldController.text;
                  final Company newCompany = Company(name);
                  Navigator.pop(context, newCompany);
                },
                child: const Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
