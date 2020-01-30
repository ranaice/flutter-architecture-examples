// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatalogModel on CatalogModelBase, Store {
  Computed<int> _$catalogSizeComputed;

  @override
  int get catalogSize =>
      (_$catalogSizeComputed ??= Computed<int>(() => super.catalogSize)).value;
  Computed<List<ShopItem>> _$shopCartComputed;

  @override
  List<ShopItem> get shopCart =>
      (_$shopCartComputed ??= Computed<List<ShopItem>>(() => super.shopCart))
          .value;

  final _$catalogAtom = Atom(name: 'CatalogModelBase.catalog');

  @override
  ObservableList<ShopItem> get catalog {
    _$catalogAtom.context.enforceReadPolicy(_$catalogAtom);
    _$catalogAtom.reportObserved();
    return super.catalog;
  }

  @override
  set catalog(ObservableList<ShopItem> value) {
    _$catalogAtom.context.conditionallyRunInAction(() {
      super.catalog = value;
      _$catalogAtom.reportChanged();
    }, _$catalogAtom, name: '${_$catalogAtom.name}_set');
  }

  final _$CatalogModelBaseActionController =
      ActionController(name: 'CatalogModelBase');

  @override
  dynamic setAddedToCart(ShopItem item, bool value) {
    final _$actionInfo = _$CatalogModelBaseActionController.startAction();
    try {
      return super.setAddedToCart(item, value);
    } finally {
      _$CatalogModelBaseActionController.endAction(_$actionInfo);
    }
  }
}
