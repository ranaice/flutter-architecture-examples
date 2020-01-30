import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart_mobx/screens/items_screen.dart';
import 'package:shop_cart_mobx/store/catalog_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CatalogModel>(
      create: (_) => CatalogModel(),
      child: MaterialApp(
        theme: ThemeData.light(),
        home: ItemsScreen(),
      ),
    );
  }
}
