import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import '../../blocs/address_cubit.dart';
import '../../models/address_model.dart';


class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  _SearchAddressState createState() => _SearchAddressState();
}

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
                  context.read<AddressCubit>().fetchAddresses(query);
                }
              });
            },
          ),
          Expanded(
            child: BlocBuilder<AddressCubit, List<Address>>(
              builder: (context, addresses) {
                return ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    return ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(address.street),
                      subtitle: Text('${address.city}, ${address.postCode}'),
                      onTap: () {
                        Navigator.pop(context, address);
                      },
                    );
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