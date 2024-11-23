import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_programming_ca224/provider/provider.dart';
import 'package:mobile_programming_ca224/main.dart';
import 'package:mobile_programming_ca224/provider/country_provider.dart';

void main() {
  testWidgets('Tambah Negara baru dan tampilkan', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => CountryProvider(),
        child: MyApp(),
      ),
    );

    // Memastikan tombol add muncul
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap untuk membuka FormScreen
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Mengisi form
    await tester.enterText(find.byType(TextFormField).at(0), 'ID');
    await tester.enterText(find.byType(TextFormField).at(1), 'Indonesia');
    await tester.enterText(
        find.byType(TextFormField).at(2), 'Negara kepulauan');
    await tester.enterText(
        find.byType(TextFormField).at(3), 'assets/images/indonesia.png');

    // Tap tombol Simpan
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Memastikan negara ditambahkan
    expect(find.text('Indonesia'), findsOneWidget);
  });
}
