import 'package:deviceselllingapp/core/store.dart';
import 'package:deviceselllingapp/models/cart.dart';
import 'package:deviceselllingapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(height: 3),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          VxConsumer(
              mutations: {RemoveMutation},
              notifications: {},
              builder: (context,_,status){
                return  "\$${_cart.totalPrice}".text.xl5.green700.make();
              }
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                  SnackBar(
                      content: "Buying not supported yet".text.make()
                  ));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff242324)),
            ),
            child: "Buy".text.bold.xl2.green300.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) =>
            ListTile(
              leading: Icon(Icons.done_outline),
              trailing: IconButton(
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                  icon: Icon(Icons.remove_circle_outline_outlined)
              ),
              title: _cart.items[index].name.text.make(),
            )
    );
  }
}


