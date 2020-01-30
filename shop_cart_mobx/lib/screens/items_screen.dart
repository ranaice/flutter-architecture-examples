import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart_mobx/screens/shop_cart_screen.dart';
import 'package:shop_cart_mobx/store/cart_model.dart';
import 'package:shop_cart_mobx/store/catalog_model.dart';

import '../shop_item.dart';

class ItemsScreen extends StatefulWidget {
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  CartModel _cartModel;
  final CatalogModel _catalogModel = CatalogModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartModel = Provider.of<CartModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
          itemCount: _catalogModel.catalogSize,
          itemBuilder: (_, index) {
            final item = _catalogModel.catalog[index];
            return _listItem(item);
          }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Items'),
      actions: <Widget>[
        Stack(
          alignment: Alignment(0.7, 0.8),
          fit: StackFit.loose,
          children: <Widget>[
            IconButton(
              onPressed: _onTapShopCart,
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red[400]),
                child: Center(
                  child: Text(
                    _cartModel.numOfItemsOnCart.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _listItem(ShopItem item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Hero(
          tag: 'shop-cart-${item.name}',
          child: Image.network(
            item.image,
            width: 60,
          ),
        ),
        title: Text(item.name),
        trailing: Checkbox(
            value: item.addedToCart,
            onChanged: (newValue) {
              setState(() {
                _catalogModel.setAddedToCart(item, newValue);
                item.addedToCart = newValue;
                newValue ? _cartModel.addToCart(item) : _cartModel.removeFromCart(item);
              });
            }),
      ),
    );
  }

  _onTapShopCart() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ShopCartScreen()));
  }
}
