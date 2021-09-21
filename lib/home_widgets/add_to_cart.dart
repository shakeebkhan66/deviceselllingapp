import 'package:deviceselllingapp/core/store.dart';
import 'package:deviceselllingapp/models/cart.dart';
import 'package:deviceselllingapp/models/catalog.dart';
import 'package:deviceselllingapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return  ElevatedButton(
      onPressed: (){
        if(!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
          shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isInCart ? Icon(Icons.done) : Icon(Icons.add_shopping_cart_rounded),
    );
  }
}