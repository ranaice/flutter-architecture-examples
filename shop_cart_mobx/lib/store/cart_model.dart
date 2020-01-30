import 'package:mobx/mobx.dart';
import 'package:shop_cart_mobx/shop_item.dart';

part 'cart_model.g.dart';

class CartModel = CartModelBase with _$CartModel;

abstract class CartModelBase with Store {
  @observable
  ObservableList<ShopItem> shopCart = ObservableList<ShopItem>();

  @computed
  int get numOfItemsOnCart => shopCart.length;

  @action
  addToCart(ShopItem item) {
    shopCart.add(item);
  }

  @action
  removeFromCart(ShopItem item) {
    shopCart.remove(item);
  }
}
