import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekeeper/models/item_model.dart';
import 'package:storekeeper/widgets/exceptions.dart';

import '../controlleers/mystore.dart';
import '../widgets/containers.dart';
import '../widgets/textfieldc.dart';
import 'drawerx.dart';

class CartPage extends StatelessWidget {
  TextEditingController search = TextEditingController();
  MyStore mystore = Get.put(MyStore());


  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Cart Items'),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  mystore.totalamount.value = 0.0;
                  for (var element in mystore.cart_items) {mystore.totalamount.value += int.parse(element.price)* int.parse(element.quantity.toString());}
                  return Text("GHS ${mystore.totalamount.toString()}");
                }),
                Text('Total Payment')
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(() {
              if (mystore.cart_items.value.length == 0)
                return NoItem(
                  title: "Cart",
                );
              return ListView.builder(
                itemCount: mystore.cart_items.value.length,
                itemBuilder: (BuildContext context, int index) {
                  List<ItemClass> cart = mystore.cart_items.value;
                  double total = (double.parse(cart[index].price) *
                      double.parse(cart[index].quantity.toString()));
                  return Obx(() {
                    return Dismissible(
                      key: Key(mystore.cart_items.value[index].name),
                      onDismissed: (DismissDirection dir) {
                        mystore.removeItem(mystore.cart_items.value[index]);
                        mystore.cart_items.refresh();
                        dir == DismissDirection.startToEnd
                            ? print('done')
                            : print('not done');
                      },
                      child: Card(
                        child: Container(
                          height: 100,
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(23),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: appImage(cart[index].image),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          cart[index].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        width: Get.width / 3,
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                          '${cart[index].price
                                              .toString()} X ${cart[index]
                                              .quantity}'),
                                      Text(total.toString()),
                                    ],
                                  )
                                ],
                              ),
                              Container(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            mystore.decreaseItem(
                                                cart[index], index),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                            BorderRadius.circular(9),
                                          ),
                                          child: Center(child: Text('-')),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Obx(() {
                                        return Text(
                                            '${cart[index].quantity.obs}');
                                      }),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          mystore.additemcart(
                                              cart[index].obs.value, index);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                            BorderRadius.circular(9),
                                          ),
                                          child: Center(child: Text('+')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                },
              );
            }),
          ),
          Obx(() {
            if (mystore.cart_items.length != 0) {
              return Column(
                children: [
                  ContainerWithTextCentered(
                    bgColor: Colors.teal,
                    width: Get.width / 2,
                    text: 'Add all to sales',
                    ontap: () {
                      mystore.addMoreSaleitem();
                    },
                  ),
                  ContainerWithTextCentered(
                    bgColor: Colors.teal,
                    width: Get.width / 2,
                    ontap: () {
                      Get.defaultDialog(
                          middleText:
                          'Do you want to remove all item from cart?',
                          onConfirm: () {
                            mystore.cart_items.clear();
                            Get.back(closeOverlays: true);
                          },
                          onCancel: () {
                            Get.back(closeOverlays: true);
                          });
                    },
                    text: 'Clear Cart',
                  ),
                ],
              );
            }
            return SizedBox();
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Container(
              height: Get.size.height * (3.5 / 4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(children: [
                CustomTextfield(label: 'search item',
                  controller: search,
                  onChange: (val) => mystore.Searchtile(val),),
                Expanded(
                  child: Obx(() {
                    if (mystore.searchtiles.value
                        .length == 0)
                      return Text('No item with such name or search is empty');
                    return ListView.builder(itemCount: mystore.searchtiles.value
                        .length,
                      itemBuilder: (BuildContext context, int index) {
                        ItemClass element = mystore.searchtiles.value[index];
                        return InkWell(
                            onTap: () {
                              if (mystore.cart_items.value.contains(element) ==
                                  false) {
                                mystore.additem(element);
                              } else {
                                mystore.removeItem(element);
                              }
                            },
                            child: Card(child:
                            ListTile(title:
                            Text(element.name),)));
                      },);
                  }),
                ),
              ],),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
