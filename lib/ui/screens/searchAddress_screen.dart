import 'package:flutter/material.dart';
import 'dart:async';

import '../../models/address_model.dart';
import '../../repositories/address_repository.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  _SearchAddressState createState() => _SearchAddressState();
}

List<Address> _addresses = [
  Address('Place du Ralliement', 'Angers', '49000'),
  Address('19 rue André le Notre', 'Angers', '49066'),
];

class _SearchAddressState extends State<SearchAddress> {
  Timer? _debounce;
  ScaffoldMessengerState? _scaffoldMessenger;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scaffoldMessenger = ScaffoldMessenger.of(context);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Search Address'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Rechercher une adresse',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                if (query.length >= 3) {
                  final AddressRepository addressRepository = AddressRepository();
                  addressRepository.fetchAddresses(query).then((addresses) {
                    setState(() {
                      _addresses = addresses;
                    });
                  }).catchError((error) {
                    _scaffoldMessenger?.showSnackBar(
                      SnackBar(content: Text('Failed to load addresses: $error')),
                    );
                  });
                }
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                final address = _addresses[index];
                return ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(address.street),
                  subtitle: Text('${address.city}, ${address.postCode}'),
                  onTap: () {
                    Navigator.pop(context, address);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}