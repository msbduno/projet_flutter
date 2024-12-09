import 'package:bloc/bloc.dart';
import '../models/address_model.dart';
import '../repositories/address_repository.dart';

/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class AddressCubit  extends Cubit<List<Address>> {
  final AddressRepository addressRepository;

  AddressCubit(this.addressRepository) : super([]);

  /// Méthode pour charger la liste d'entreprise
  Future<void> loadAddresses() async {
    emit([
      Address('street', 'city', 'postcode'),
      Address('street', 'city', 'postcode'),
      Address('street', 'city', 'postcode'),
    ]);
  }


  /// Méthode pour rechercher une adresse
  Future<void> fetchAddresses(String query) async {
    try {
      final addresses = await addressRepository.fetchAddresses(query);
      emit(addresses);
    } catch (error) {
      emit([]);
    }

  }
}