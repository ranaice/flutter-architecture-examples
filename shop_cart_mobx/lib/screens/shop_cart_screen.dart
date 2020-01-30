import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart_mobx/store/catalog_model.dart';

class ShopCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _catalogModel = Provider.of<CatalogModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: _catalogModel.shopCart.length == 0
          ? _emptyText()
          : Center(
              child: ListView.builder(
                  itemCount: _catalogModel.shopCart.length,
                  itemBuilder: (context, index) {
                    final item = _catalogModel.shopCart[index];
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
      style: TextStyle(fontSize: 18),
    ));
  }
}
