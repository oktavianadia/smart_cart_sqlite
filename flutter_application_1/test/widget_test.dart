import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Halaman Katalog Produk tampil', (WidgetTester tester) async {
    // Build aplikasi dan trigger satu frame.
    await tester.pumpWidget(const SmartCartApp());

    // Verifikasi judul AppBar dan halaman katalog muncul.
    expect(find.text('Smart-Cart'), findsOneWidget);
    expect(find.text('Katalog Produk'), findsOneWidget);

    // Verifikasi tombol "Tambah" ada pada tiap kartu produk.
    expect(find.text('Tambah'), findsWidgets);
  });
}