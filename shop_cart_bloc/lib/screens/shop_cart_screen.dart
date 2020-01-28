import 'package:flutter/material.dart';
import 'package:shop_cart_bloc/shop_item.dart';

class ShopCartScreen extends StatelessWidget {
  final List<ShopItem> shopItems;

  ShopCartScreen(this.shopItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: shopItems.length,
            itemBuilder: (context, index) {
              final item = shopItems[index];
              return ListTile(
                title: Text('${item.name}'),
              );
            }),
      ),
    );
  }
}
