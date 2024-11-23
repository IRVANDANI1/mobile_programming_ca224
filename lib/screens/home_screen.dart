import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/provider/country_provider.dart';
import 'package:mobile_programming_ca224/screens/form_screen.dart';
import 'package:mobile_programming_ca224/provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Negara'),
      ),
      body: ListView.builder(
        itemCount: countryProvider.countries.length,
        itemBuilder: (context, index) {
          final country = countryProvider.countries[index];
          return Card(
            child: ListTile(
              leading: Image.asset(country.flagImage, width: 50, height: 50),
              title: Text(country.name),
              subtitle: Text(country.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormScreen(
                            country: country,
                            index: index,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      countryProvider.deleteCountry(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
