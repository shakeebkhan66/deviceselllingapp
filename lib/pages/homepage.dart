import 'dart:convert';
import 'package:deviceselllingapp/core/store.dart';
import 'package:deviceselllingapp/home_widgets/catalog.list.dart';
import 'package:deviceselllingapp/home_widgets/catalog_header.dart';
import 'package:deviceselllingapp/models/cart.dart';
import 'package:deviceselllingapp/models/catalog.dart';
import 'package:deviceselllingapp/utils/routes.dart';
import 'package:deviceselllingapp/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //  await Future.delayed(Duration(seconds: 2));
    // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //Todo this line is used to create dummy list to check the functionality
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //         "Catalog App",
      //       textAlign: TextAlign.center,
      //       style: TextStyle(fontWeight: FontWeight.bold),
      //     ),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty) ? ListView.builder(
      //     itemCount: CatalogModel.items.length,
      //       itemBuilder: (context, index){
      //        return ItemWidget(
      //          item: CatalogModel.items[index],
      //        );
      //       }
      //   ) : Center(
      //     child: CircularProgressIndicator(),
      //   )
      // ),

      //Todo MyDrawer is the name of Drawer Class. I designed Drawer in MyDrawer Page to ensure neatness in this page
      floatingActionButton: VxConsumer(
        notifications: {},
        mutations: {AddMutation, RemoveMutation},
        builder: (context,_,status)=> FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(Icons.add_shopping_cart_outlined),
        ).badge(color: Colors.green, size: 20, count: _cart.items.length, textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}




