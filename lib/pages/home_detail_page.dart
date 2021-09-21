import 'package:deviceselllingapp/home_widgets/add_to_cart.dart';
import 'package:deviceselllingapp/models/catalog.dart';
import 'package:deviceselllingapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {

  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(backgroundColor: Colors.transparent,),
      bottomNavigationBar:  Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 35),
          ],
        ).p8(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                  catalog.image
              ),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(MyTheme.darkBluishColor).xl.bold.make(),
                      catalog.desc.text.make(),
                      "A mobile phone, cellular phone, cell phone, cellphone, handphone, or hand phone, sometimes shortened to simply mobile, cell or just phone, is a portable telephone"" that can make and receive calls over a radio frequency link while the user is moving within a telephone service area."
                          .text.make().px16(),
                      10.heightBox,
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
