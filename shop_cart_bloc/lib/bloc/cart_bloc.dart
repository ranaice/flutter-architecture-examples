import 'dart:async';

import 'package:shop_cart_bloc/bloc/bloc_provider.dart';
import 'package:shop_cart_bloc/shop_item.dart';

// The bloc class will be where the Business Logic will live. Here the UI will call methods to change states internally
// and then the UI can rebuild based on state changes. The bloc could be understood as the Presenter in MVP Architecture or
// the controller in MVC.
class CartBloc extends BlocBase {
  // Provides the stream and the sink to the widgets interested, however outside of this class there should be no way to
  // directly access the sink, all of the changes should be made via methods (events) inside the bloc. The widgets will
  // listen to the stream and then be notified when something changes.
  StreamController _controller = StreamController<List<ShopItem>>.broadcast();

  Stream<List<ShopItem>> get streamCart => _controller.stream;

  List<ShopItem> shopCart = [];

  void addItem(ShopItem shopItem) {
    shopCart.add(shopItem);
    _controller.add(shopCart);
  }

  void removeItem(ShopItem shopItem) {
    shopCart.remove(shopItem);
    _controller.add(shopCart);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
