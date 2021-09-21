import 'package:deviceselllingapp/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel{
  // //Todo how to make singleton object
  // static final cartModel = CartModel._internal();
  // CartModel._internal();
  // factory CartModel() => cartModel;


  //Todo catalog field
  late CatalogModel _catalog;

  //Todo collection of ID's store ID's of each item
  final List<int> _itemIds = [];
  //Todo get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog = newCatalog;
  }

  //Todo Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByid(id)).toList();

  //Todo Total Price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

// //Todo Add Item
// void add(Item item){
//   _itemIds.add(item.id);
// }

//Todo Remove Item
// void remove(Item item){
//    _itemIds.remove(item.id);
// }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}