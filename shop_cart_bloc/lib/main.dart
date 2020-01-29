import 'package:flutter/material.dart';
import 'package:shop_cart_bloc/bloc/bloc_provider.dart';
import 'package:shop_cart_bloc/bloc/cart_bloc.dart';
import 'package:shop_cart_bloc/screens/items_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inject the blocs you want to provide down the widget tree.
    // If the bloc must be available across all the application or diferrent pages(routes), it should be injected here,
    // via BlocProvider. If you only need the bloc within a widget tree, the BlocProvider can be wrapping the parent widget.
    // If, however, you only need the Bloc inside one widget, then it's acceptable to instantiate it inside the widget,
    // but in this case remember to call the dispose manually inside the dispose method of the Stateful widget.
    return BlocProvider(
      bloc: CartBloc(),
      child: MaterialApp(
        theme: ThemeData.light(),
        home: ItemsScreen(),
      ),
    );
  }
}
