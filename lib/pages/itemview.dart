import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekeeper/controlleers/mystore.dart';
import '../controlleers/mastercontroller.dart';
import '../models/item_model.dart';
import '../widgets/containers.dart';
import '../widgets/exceptions.dart';
import 'edit_item_page.dart';

class ItemPage extends StatelessWidget {
  ItemClass item;
  MyStore mystore = Get.put(MyStore());

  ItemPage({Key? key, required this.item}) : super(key: key);
  final MasterController controller = Get.put(MasterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: Text('Item Preview'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: appImage(item.image), fit: BoxFit.cover)),
                  ),
                  ListTile(
                    title: Text(
                      item.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(
                      Icons.star_rate,
                      color: Colors.yellow,
                    ),
                    subtitle: Text("${item.avaliable} avaliable"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(),
                      Text(
                        'GHS ${item.price.toString()}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Divider(
                    height: 16,
                  ),
                  ExpansionTile(
                    title: Text("Specification"),
                    children: [
                      EListTile(title: 'Name', value: item.name),
                      EListTile(
                          title: 'Price',
                          value: 'GHS ${item.price.toString()}'),
                      EListTile(
                          title: 'Avaliable', value: item.avaliable.toString()),
                      //   EListTile(
                      //       title: 'Date Added',
                      //       value:
                      //           "${DateTime(int.parse(item.date)).day}/${DateTime(int.parse(item.date)).month}/${DateTime(int.parse(item.date))}"),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Obx(() {
                return ContainerWithTextCentered(
                  width: Get.width / 2,
                  bgColor: mystore.cart_items.value.contains(item) != false
                      ? Colors.purple
                      : Colors.teal,
                  ontap: () {
                    if (mystore.cart_items.value.contains(item) == false) {
                      mystore.additem(item);
                    } else {
                      mystore.removeItem(item);
                    }
                  },
                  text: 'Add To cart',
                );
              }),
              ContainerWithTextCentered(
                width: Get.width / 2.4,
                bgColor: Colors.teal,
                text: 'Edit',
                ontap: () {
                  Get.to(() => EditItemPage(
                        item: item,
                      ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EListTile extends StatelessWidget {
  String title;
  String value;

  EListTile({Key? key, required this.value, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$title  :'),
      trailing: Text(value),
    );
  }
}
