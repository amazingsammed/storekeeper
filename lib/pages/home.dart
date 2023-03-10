import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:storekeeper/models/item_model.dart';
import 'package:storekeeper/pages/createpage.dart';

import '../controlleers/mystore.dart';
import '../widgets/containers.dart';
import '../widgets/exceptions.dart';
import 'drawerx.dart';
import 'itemview.dart';

class Home extends StatelessWidget {
  MyStore con = Get.put(MyStore());

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CreatePage());
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Obx(() {
        if (con.items.value.length == 0) return NoItem(title: 'Store Items');
        return ListView.builder(
          itemCount: con.items.value.length,
          itemBuilder: (BuildContext context, int index) {
            ItemClass element = con.items.value[index];
            return InkWell(
              onTap: () {
                Get.to(() => ItemPage(
                      item: element,
                    ));
              },
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: appImage(element.image),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                element.name,
                                style: TextStyle(fontSize: 23),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "${element.avaliable}/${element.total} items"),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Ghs ${element.price.toString()}",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Spacer(),
                                  ContainerEnable(
                                    item: element,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class ContainerEnable extends StatelessWidget {
  MyStore mystore = Get.find();
  ItemClass item;
  ContainerEnable({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (mystore.cart_items.value.contains(item) == false) {
          mystore.additem(item);
        } else {
          mystore.removeItem(item);
        }
      },
      child: Obx(() {
        return Container(
          height: 40,
          width: 60,
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: mystore.cart_items.value.contains(item) != false
                  ? Colors.purple
                  : Colors.teal),
          child: Text(
            'Cart',
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
