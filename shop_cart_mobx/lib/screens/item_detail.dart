import 'package:flutter/material.dart';

import '../shop_item.dart';

class ItemDetailScreen extends StatelessWidget {
  final ShopItem item;

  ItemDetailScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Hero(
        tag: 'shop-cart-${item.name}',
        child: Align(
          alignment: Alignment(0, -1),
          child: Image.network(
            item.image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
