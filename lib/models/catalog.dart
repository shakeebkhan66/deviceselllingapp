import 'package:flutter/material.dart';

class CatalogModel{

  // //Todo how to make singleton object
  // static final catModel = CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel() => catModel;

  static List<Item> items = [];

  //Todo get item by id
  Item getByid(int id)=> items.firstWhere((element) => element.id == id, orElse: null);

  //Tod get item by position
  Item getByPosition(var pos)=> items[pos];
}


class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price,  required this.color, required this.image});
  factory Item.fromMap(Map<String, dynamic> map){
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]
    );
  }

  // Encode Object Into String Opposite function of upper method
  toMap()=> {
    "id" : id,
    "name": name,
    "desc" : desc,
    "price" : price,
    "color" : color,
    "image" : image,
  };
}
