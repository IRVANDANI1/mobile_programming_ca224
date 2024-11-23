import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/provider/provider.dart';
import 'package:mobile_programming_ca224/provider/country_provider.dart';
import 'package:mobile_programming_ca224/models/country.dart';

class FormScreen extends StatefulWidget {
  final Country? country;
  final int? index;

  FormScreen({this.country, this.index});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? code;
  String? name;
  String? description;
  String? flagImage;

  @override
  void initState() {
    super.initState();
    if (widget.country != null) {
      code = widget.country!.code;
      name = widget.country!.name;
      description = widget.country!.description;
      flagImage = widget.country!.flagImage;
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newCountry = Country(
        code: code!,
        name: name!,
        description: description!,
        flagImage: flagImage!,
      );

      final provider = Provider.of<CountryProvider>(context, listen: false);

      if (widget.country == null) {
        provider.addCountry(newCountry);
      } else {
        provider.updateCountry(widget.index!, newCountry);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.country == null ? 'Tambah Negara' : 'Edit Negara'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: code,
                decoration: InputDecoration(labelText: 'Kode Negara'),
                onSaved: (value) => code = value,
                validator: (value) => value!.isEmpty ? 'Wajib diisi!' : null,
              ),
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: 'Nama Negara'),
                onSaved: (value) => name = value,
                validator: (value) => value!.isEmpty ? 'Wajib diisi!' : null,
              ),
              TextFormField(
                initialValue: description,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                onSaved: (value) => description = value,
              ),
              TextFormField(
                initialValue: flagImage,
                decoration: InputDecoration(labelText: 'Path Gambar'),
                onSaved: (value) => flagImage = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
