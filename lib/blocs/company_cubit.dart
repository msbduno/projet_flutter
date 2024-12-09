import 'package:bloc/bloc.dart';
import '../models/address_model.dart';
import '../models/company_model.dart';
import '../repositories/preferences_repository.dart';

/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class CompanyCubit extends Cubit<List<Company>> {

  final PreferencesRepository preferencesRepository;

  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit(this.preferencesRepository) : super([]);


  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    try {
      final List<Company> companies = await preferencesRepository.loadCompanies();
      emit(companies);
    } catch (error) {
      emit([]);
      print('Error: $error');
    }
  }

  /// Méthode pour ajouter une entreprise
  void addCompany(Company company) async {
    final updatedCompanies = [...state, company];
    emit(updatedCompanies);
    await preferencesRepository.saveCompanies(updatedCompanies);
  }

  void removeCompany(String companyName) {
    emit(state.where((company) => company.name != companyName).toList());
  }
}
