import 'package:flutter/material.dart';
import 'package:shop_cart_mobx/screens/items_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: ItemsScreen(),
    );
  }
}
