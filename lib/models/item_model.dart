import 'package:flutter/cupertino.dart';

class ItemClass {
  int? id;
  String image;
  String name;
  String price;
  String actualprice;
  int avaliable;
  int total;
  int? quantity;
  String date;
  String categoryid;
  String storeid;

  ItemClass(
      {required this.image,
      this.id,
      required this.name,
      required this.price,
      required this.categoryid,
      required this.actualprice,
      required this.date,
      required this.storeid,
      this.quantity = 1,
      required this.avaliable,
      required this.total});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'image': this.image,
      'name': this.name,
      'price': this.price,
      'actualprice': this.actualprice,
      'avaliable': this.avaliable,
      'total': this.total,
      'date': this.date,
      'categoryid': this.categoryid,
      'storeid': this.storeid,
    };
  }

  factory ItemClass.fromMap(Map<String, dynamic> map) {
    return ItemClass(
      id: map['id'] as int,
      image: map['image'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      actualprice: map['actualprice'] as String,
      avaliable: map['avaliable'] as int,
      total: map['total'] as int,
      date: map['date'] as String,
      categoryid: map['categoryid'] as String,
      storeid: map['storeid'] as String,
    );
  }
}
