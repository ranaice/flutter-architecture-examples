import 'package:flutter/material.dart';

import '../shop_item.dart';

class ShopCartScreen extends StatelessWidget {
  final List<ShopItem> shopItems;

  ShopCartScreen(this.shopItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: shopItems.length == 0
          ? _emptyText()
          : Center(
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

  Center _emptyText() {
    return Center(
        child: Text(
      'No items added to the cart. :(',
      style: TextStyle(
        fontSize: 18,
      ),
    ));
  }
}
