import 'package:flutter/material.dart';
import 'package:shop_cart_bloc_library/screens/items_screen.dart';

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
