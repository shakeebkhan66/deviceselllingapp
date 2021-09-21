import 'package:deviceselllingapp/models/cart.dart';
import 'package:deviceselllingapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';


//Todo VxState store can handle all the operation we'll perform in our application
class MyStore extends VxStore{
  late CatalogModel catalog;
  late CartModel cart;

//Todo Constructor
  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }

}