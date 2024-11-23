import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryProvider with ChangeNotifier {
  final List<Country> _countries = [
    Country(
      code: "ID",
      name: "Indonesia",
      description: "Negara kepulauan di Asia Tenggara.",
      flagImage: "assets/images/indonesia.png",
    ),
    Country(
      code: "US",
      name: "United States",
      description: "Negara di Amerika Utara.",
      flagImage: "assets/images/us.png",
    ),
  ];

  List<Country> get countries => _countries;

  void addCountry(Country country) {
    _countries.add(country);
    notifyListeners();
  }

  void updateCountry(int index, Country updatedCountry) {
    _countries[index] = updatedCountry;
    notifyListeners();
  }

  void deleteCountry(int index) {
    _countries.removeAt(index);
    notifyListeners();
  }
}
