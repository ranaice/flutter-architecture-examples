import 'dart:async';

import 'package:shop_cart_bloc/bloc/bloc_provider.dart';
import 'package:shop_cart_bloc/shop_item.dart';

// The bloc class will contain the Business Logic. Here the UI will call methods to change states internally
// and then the UI can rebuild based on state changes. The bloc could be understood as the Presenter in MVP Architecture or
// the Controller in MVC.
// Instead of defining methods to change the bloc state directly, we could define a separate class containing this bloc
// possible Events and States and operate inside the bloc based on the Events inputed and the screen would changed based on the
// state.
// Our approach here tho is to let the methods be our "events", so they can change the state.
// Note that this implementation is only a simple implementation of bloc, if we would in fact use the root impl of bloc,
// we would end with so much boilerplate code. There is a library that abstract a lot of the boilerplate and complexity,
// that lib is flutter_bloc and there is a diff project in this repo that implements this shop cart using the lib.
// You can read more about bloc here: https://www.didierboelens.com/2018/12/reactive-programming---streams---bloc---practical-use-cases/
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
