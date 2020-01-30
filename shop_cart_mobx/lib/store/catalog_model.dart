import 'package:mobx/mobx.dart';
import 'package:shop_cart_mobx/shop_item.dart';

part 'catalog_model.g.dart';

class CatalogModel = CatalogModelBase with _$CatalogModel;

abstract class CatalogModelBase with Store {
  @observable
  ObservableList<ShopItem> catalog = [
    ShopItem(name: 'Shirt', image: 'https://images-na.ssl-images-amazon.com/images/I/41xCWDx-OyL.jpg'),
    ShopItem(
        name: 'Shoes',
        image:
            'https://rukminim1.flixcart.com/image/714/857/jmwch3k0/shoe/j/y/n/dg-292-white-blue-patti-10-digitrendzz-white-original-imaf9p36fkykfjqt.jpeg?q=50'),
    ShopItem(name: 'Blanket', image: 'https://images-na.ssl-images-amazon.com/images/I/71THWcYwDML._AC_SY450_.jpg'),
    ShopItem(name: 'TV', image: 'https://http2.mlstatic.com/D_NQ_NP_986822-MLA31521904233_072019-W.jpg'),
    ShopItem(name: 'Smartphone', image: 'https://imagens.canaltech.com.br/produto/1540320629-3958-principal-m.png'),
    ShopItem(
        name: 'PS4',
        image:
            'https://http2.mlstatic.com/console-ps4-pro-4k-1-tb-novo-original-sony-7215-D_NQ_NP_852066-MLB31072431446_062019-F.jpg'),
    ShopItem(
        name: 'XBOX',
        image: 'https://i.zst.com.br/images/console-xbox-one-s-1-tb-microsoft-hdr-4k-photo131312234-12-3d-14.jpg'),
    ShopItem(name: 'Mousepad', image: 'https://images9.kabum.com.br/produtos/fotos/79279/79279_1502734852_g.jpg'),
    ShopItem(name: 'Keyboard', image: 'https://cwsmgmt.corsair.com/media/hybris/tlc/keyboards/TLC_keyboard_banner.jpg'),
  ].asObservable();

  @computed
  int get catalogSize => catalog.length;

  @computed
  List<ShopItem> get shopCart => catalog.where((shopItem) => shopItem.addedToCart).toList();

  @action
  setAddedToCart(ShopItem item, bool value) {
    item.addedToCart = value;
  }
}
