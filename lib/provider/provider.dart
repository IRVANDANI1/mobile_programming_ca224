import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/models/country.dart';

class CountryProvider with ChangeNotifier {
  List<Country> _countries = [];

  List<Country> get countries {
    return [..._countries];
  }

  void addCountry(Country country) {
    _countries.add(country);
    notifyListeners(); // Memberitahukan semua widget yang mendengarkan perubahan
  }

  void updateCountry(int index, Country country) {
    _countries[index] = country;
    notifyListeners(); // Memberitahukan perubahan data negara
  }

  void deleteCountry(int index) {
    _countries.removeAt(index);
    notifyListeners(); // Memberitahukan perubahan setelah data dihapus
  }
}
