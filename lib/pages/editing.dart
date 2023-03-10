import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:storekeeper/pages/sales_events.dart';

import 'cart_page.dart';
import 'createpage.dart';
import 'delete_page.dart';

class Editing extends StatelessWidget {
  const Editing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Editing'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerX(
                  ontap: () {
                    Get.to(() => CreatePage());
                  },
                  icon: MdiIcons.creation,
                  title: 'Create Item',
                  data: 'Add a new item to the store item',
                ),
                SizedBox(
                  width: 10,
                ),
                ContainerX(
                  icon: Icons.energy_savings_leaf,
                  title: 'Check Sales',
                  data: 'Verify Sales events in store',
                  ontap: () {
                    Get.to(() => SalesEvent());
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerX(
                  ontap: () {
                    Get.to(() => CartPage());
                  },
                  icon: Icons.shopping_cart,
                  title: 'Check Cart',
                  data: 'Check store items in Cart',
                ),
                SizedBox(
                  width: 10,
                ),
                ContainerX(
                  ontap: () {
                    Get.to(() => DeletePage());
                  },
                  icon: Icons.delete_forever,
                  title: 'Delete item',
                  data: 'Delete item in store',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerX extends StatelessWidget {
  String title;
  String data;
  Function()? ontap;
  IconData icon;
  ContainerX(
      {Key? key,
      required this.icon,
      required this.title,
      required this.data,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white),
        height: MediaQuery.of(context).size.width / 2.3,
        width: MediaQuery.of(context).size.width / 2.4,
        child: Column(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: Colors.teal),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    icon,
                    size: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
