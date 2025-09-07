import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekeeper/controlleers/sqflite.dart';
import 'package:storekeeper/models/sales_model.dart';

import '../models/item_model.dart';

class MyStore extends Dbhelper {
  var items = <ItemClass>[].obs;
  var cart_items = <ItemClass>[].obs;
  var sales = <Sales>[].obs;
  var image = ''.obs;
  var gallery = false.obs;
  var searchtiles = <ItemClass>[].obs;
  var totalamount = 0.00.obs;



  dynamic sam(data, query) {
    return data.toLowerCase().contains(query.toLowerCase());
  }

  void Searchtile(String query) {
    if(query.trim().characters.length != 0){
    final abc =
    items.where((element) => sam(element.name, query)).toList();
    searchtiles.value = abc.obs;}else{
      searchtiles.value = [];
    }
  }


  @override
  onInit() {
    getAllItems();
    getAllSales();
    super.onInit();
  }

  Future<List<ItemClass>> getAllItems() async {
    items.clear();
    var dbClient = await db;
    List<Map<String, dynamic>> lists =
        await dbClient!.query('items', orderBy: 'name');
    print(lists);
    for (var element in lists) {
      items.add(ItemClass.fromMap(element));
    }
    return items;
  }

  Future<void> addItemtoDB(ItemClass itemValue) async {
    items.clear();
    var dbClient = await db;
    await dbClient!.insert('items', itemValue.toMap());
    image.value = '';
    getAllItems();
  }

  Future<void> deleteItemfromDB(ItemClass itemValue) async {
    items.clear();
    var dbClient = await db;
    await dbClient!.delete('items', where: "id = ${itemValue.id}");
    getAllItems();
  }

  Future<void> updateIteminDB(ItemClass itemValue) async {
    items.clear();
    var dbClient = await db;
    await dbClient!
        .update('items', itemValue.toMap(), where: 'id = ${itemValue.id}');
    getAllItems();
  }

  Future<void> addSaleitem(Sales saleitem, int newavaliable, int? id) async {
    sales.clear();
    var dbClient = await db;
    await dbClient!.rawQuery(
        'UPDATE "main"."items" SET "avaliable" = $newavaliable WHERE rowid = $id');
    await dbClient.insert('sales', saleitem.toMap());
    getAllItems();
    getAllSales();
  }

  void addMoreSaleitem() {
    cart_items.value.forEach((element) {
      int newavaliable = element.avaliable - element.quantity!;
      Sales saleitem = Sales(
          id: element.id.toString(),
          price: element.price,
          quantity: element.quantity.toString(),
          total: "${double.parse(element.price) * element.quantity!}",
          date: DateTime.now().toString());
      addSaleitem(saleitem, newavaliable, element.id);
    });
    cart_items.clear();
  }

  Future<List<Sales>> getAllSales() async {
    sales.clear();
    var dbClient = await db;
    List<Map<String, dynamic>> lists = await dbClient!.rawQuery(
        'SELECT sales.*, items.name FROM sales, items WHERE sales.id = items.id');
    for (var element in lists) {
      sales.add(Sales.fromMap(element));
    }
    return sales;
  }

  void additem(ItemClass items) {
    if (cart_items.contains(items)) {
      Get.snackbar(
          "Item already added", "Increase the quantity in the cart view",
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade100);
    } else {
      cart_items.add(items);
    }
  }

  void decreaseItem(ItemClass items, index) {
    if (cart_items.contains(items) && cart_items[index].quantity == 1) {
      Get.defaultDialog(
          middleText: 'Do you want to remove item from cart?',
          onConfirm: () {
            cart_items.remove(items);
            Get.back(closeOverlays: true);
          },
          onCancel: () {
            Get.back(closeOverlays: true);
          });
    } else {
      cart_items[index].quantity = cart_items[index].quantity! - 1;
      cart_items.refresh();
    }
  }

  void removeItem(ItemClass items) {
    cart_items.remove(items);
    cart_items.refresh();
  }

  void additemcart(ItemClass items, index) {
    if (cart_items.value[index].quantity! <= items.avaliable - 1) {
      cart_items[index].quantity = cart_items[index].quantity! + 1;
      print(cart_items[index].quantity);
      cart_items.refresh();
    } else {
      Get.snackbar("Alert", "Item cannot be more than the available",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade100);
    }
  }
}
