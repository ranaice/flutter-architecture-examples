import 'package:flutter/material.dart';
import 'package:shop_cart_bloc/bloc/bloc_provider.dart';
import 'package:shop_cart_bloc/bloc/cart_bloc.dart';

class ShopCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: bloc.shopCart.length == 0 ? _emptyText() : _listItem(bloc),
    );
  }

  Center _listItem(CartBloc bloc) {
    return Center(
      child: ListView.builder(
        itemCount: bloc.shopCart.length,
        itemBuilder: (context, index) {
          final item = bloc.shopCart[index];

          return ListTile(
            title: Text('${item.name}'),
          );
        },
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
