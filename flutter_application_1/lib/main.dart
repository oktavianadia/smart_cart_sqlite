import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/catalog_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const SmartCartApp());
}

class SmartCartApp extends StatelessWidget {
  const SmartCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider()), ChangeNotifierProvider(create: (_) => ProductProvider())],
      child: MaterialApp(
        title: 'Smart-Cart & E-Catalog',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const CatalogScreen(),
      ),
    );
  }
}
