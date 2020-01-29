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
      body: Center(
        child: ListView.builder(
          itemCount: bloc.shopCart.length,
          itemBuilder: (context, index) {
            final item = bloc.shopCart[index];

            return ListTile(
              title: Text('${item.name}'),
            );
          },
        ),
      ),
    );
  }

  Center _errorText(AsyncSnapshot snapshot) {
    return Center(
        child: Text(
      'Problems: ${snapshot.error}',
      style: TextStyle(color: Colors.red),
    ));
  }
}
