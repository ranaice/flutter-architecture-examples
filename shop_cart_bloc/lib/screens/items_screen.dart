import 'package:flutter/material.dart';
import 'package:shop_cart_bloc/bloc/bloc_provider.dart';
import 'package:shop_cart_bloc/bloc/cart_bloc.dart';
import 'package:shop_cart_bloc/bloc/items_bloc.dart';
import 'package:shop_cart_bloc/screens/shop_cart_screen.dart';
import 'package:shop_cart_bloc/shop_item.dart';

class ItemsScreen extends StatefulWidget {
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final itemsBloc = ItemsBloc();

  @override
  void dispose() {
    itemsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ShopItem>>(
        initialData: itemsBloc.shopItems,
        stream: itemsBloc.stream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data[index];
                  return _listItem(item);
                }),
          );
        });
  }

  AppBar _buildAppBar() {
    // Retrieve the bloc provided by BlocProvider whenever needed down the widget tree
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return AppBar(
      title: Text('Items'),
      actions: <Widget>[
        StreamBuilder(
          initialData: [],
          stream: cartBloc.streamCart,
          builder: (context, snapshot) {
            return Stack(
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
                        snapshot.data.length.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  _listItem(ShopItem item) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          item.image,
          width: 60,
        ),
        title: Text(item.name),
        trailing: Checkbox(
            value: item.addedToCart,
            onChanged: (newValue) {
              itemsBloc.changeAddedToCart(item);
              newValue ? cartBloc.addItem(item) : cartBloc.removeItem(item);
            }),
      ),
    );
  }

  _onTapShopCart() async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ShopCartScreen()));
  }
}
