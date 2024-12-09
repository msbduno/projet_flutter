import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/company_model.dart';

class PreferencesRepository {



  Future<void> saveCompanies(List<Company> companies) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final Company company in companies) {
      listJson.add(jsonEncode(company.toJson()));
    }
    prefs.setStringList('companies', listJson);
  }

  Future<List<Company>> loadCompanies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // A compléter
    final List<String> listJson = prefs.getStringList('companies') ?? [];
    return listJson.map((String json) => Company.fromJson(jsonDecode(json))).toList();
  }

}


