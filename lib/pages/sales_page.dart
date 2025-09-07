
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storekeeper/controlleers/mystore.dart';
import 'package:storekeeper/widgets/containers.dart';

import '../controlleers/mastercontroller.dart';
import '../models/item_model.dart';
import '../models/sales_model.dart';
import '../widgets/exceptions.dart';

class SalesPage extends StatelessWidget {
  MasterController controller = Get.put(MasterController());
  MyStore _myStore = Get.put(MyStore());

  SalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales'),
        actions: [
          // Obx(() {
          //   return Switch(
          //       value: controller.switchvalue.value,
          //       onChanged: (val) => controller.changeSwitch(val));
          // })
        ],
      ),
      body: Obx(() {
        if (_myStore.items.value.length == 0)
          return NoItem(title: 'Store Items');
        return ListView.builder(
          itemCount: _myStore.items.value.length,
          itemBuilder: (BuildContext context, int index) {
            ItemClass element = _myStore.items.value[index];
            return Obx(() {
              return SalesTile(
                  total: element.total.toString(),
                  image: element.image,
                  avaliable: element.avaliable.toString(),
                  price: element.price.toString(),
                  name: element.name,
                  tilecolor: _myStore.cart_items.value.contains(element)
                      ? Colors.teal.withOpacity(0.2)
                      : Colors.transparent,
                  onhold: () {
                    if (_myStore.cart_items.value.contains(element) == false) {
                      _myStore.additem(element);
                    } else {
                      _myStore.removeItem(element);
                    }
                  },
                  ontap: () {
                    double price = double.parse(element.price);
                    controller.current_quantity.value = 1;
                    Get.bottomSheet(
                        Container(
                          height: Get.height / 3,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                'Sell Item',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Divider(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.maxFinite,
                                    height: 60,
                                    child: Obx(() {
                                      return ListTile(
                                        title: Text(element.name),
                                        trailing: SizedBox(
                                          width: 130,
                                          height: 40,
                                          child: Row(
                                            children: [
                                              ContainerWithIconCentered(
                                                  ontap: () {
                                                    if (controller
                                                            .current_quantity
                                                            .value >=
                                                        2) {
                                                      controller
                                                          .current_quantity
                                                          .value = controller
                                                              .current_quantity
                                                              .value -
                                                          1;
                                                    }
                                                  },
                                                  icon: Icons.remove_rounded,
                                                  bgColor: Colors.redAccent),
                                              Obx(() {
                                                return Text(
                                                    '${controller.current_quantity.value}');
                                              }),
                                              ContainerWithIconCentered(
                                                  ontap: () {
                                                    if (controller
                                                            .current_quantity
                                                            .value <
                                                        element.avaliable)
                                                      controller
                                                          .current_quantity
                                                          .value = controller
                                                              .current_quantity
                                                              .value +
                                                          1;
                                                  },
                                                  icon: Icons.add_outlined,
                                                  bgColor: Colors.green),
                                            ],
                                          ),
                                        ),
                                        subtitle: Text(
                                            "${element.price} x ${controller.current_quantity.value}"),
                                      );
                                    }),
                                  ),
                                  Obx(() {
                                    return Text(
                                      "   GHS ${price * controller.current_quantity.value}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ContainerWithTextCentered(
                                        width: 120,
                                        ontap: () {
                                          controller.current_quantity.value = 1;
                                          Get.back(closeOverlays: true);
                                        },
                                        text: 'Cancel',
                                        bgColor: Colors.red,
                                      ),
                                      ContainerWithTextCentered(
                                        width: 120,
                                        text: 'Add to Sales',
                                        bgColor: Colors.green,
                                        ontap: () {
                                          int newavaliable = element.avaliable -
                                              controller.current_quantity.value;
                                          Sales saleitem = Sales(
                                              id: element.id.toString(),
                                              price: element.price,
                                              quantity: controller
                                                  .current_quantity.value
                                                  .toString(),
                                              total:
                                                  "${price * controller.current_quantity.value}",
                                              date: DateTime.now().toString());
                                          _myStore.addSaleitem(saleitem,
                                              newavaliable, element.id);
                                          Get.back(closeOverlays: true);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12))));
                  });
            });
          },
        );
      }),
    );
  }
}

class SalesTile extends StatelessWidget {
  String name;
  String price;
  String image;
  String total;
  String avaliable;
  Function()? ontap;
  Function()? onhold;
  Color tilecolor;

  SalesTile(
      {Key? key,
      required this.image,
      required this.avaliable,
      required this.price,
      required this.total,
      this.ontap,
      this.onhold,
      required this.tilecolor,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      onLongPress: onhold,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: appImage(image),
        ),
        title: Text(name),
        subtitle: Text("${avaliable} out of ${total} in stock"),
        trailing: Text("Ghc ${price} each"),
        tileColor: tilecolor,
      ),
    );
  }
}
