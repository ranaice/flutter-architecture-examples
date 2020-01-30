import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart_mobx/store/cart_model.dart';

class ShopCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: model.shopCart.length == 0
          ? _emptyText()
          : Center(
              child: ListView.builder(
                  itemCount: model.shopCart.length,
                  itemBuilder: (context, index) {
                    final item = model.shopCart[index];
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
