import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekeeper/pages/editing.dart';
import 'package:storekeeper/pages/home.dart';
import 'package:storekeeper/pages/createpage.dart';

import 'package:storekeeper/pages/sales_page.dart';
import '../authentication/signup_page.dart';
import 'create_stock.dart';
import 'delete_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: MyColors.grey_5,
                child: Column(
                  children: <Widget>[
                    Container(height: 20),
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: MyColors.grey_60,
                      child: CircleAvatar(
                        radius: 40,
                        //backgroundImage: Im,
                      ),
                    ),
                    Container(height: 15),
                    Text("Sammed",
                        style: MyText.title(context)!
                            .copyWith(color: MyColors.grey_90)),
                    Container(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.location_on,
                            color: MyColors.grey_20, size: 15),
                        Container(width: 5),
                        Text("Kumasi, GH",
                            style: MyText.body1(context)!
                                .copyWith(color: MyColors.grey_60)),
                      ],
                    ),
                    Container(height: 20),
                  ],
                ),
              ),
              DrawerXtile(
                title: "CRUD",
                onTap: (){
                  Get.to(()=>Editing());
                },
              ),
              DrawerXtile(
                title: "Single Sales",
                onTap: (){
                  Get.to(()=>SalesPage());
                },
              ),
              DrawerXtile(
                title: "Create Item",
                onTap: (){
                  Get.to(()=>CreatePage());
                },
              ),
              DrawerXtile(
                title: "View Items",
                onTap: (){
                  Get.to(()=>Home());
                },
              ),
              DrawerXtile(
                title: "Delete item",
                onTap: (){
                  Get.to(()=>DeletePage());
                },
              ),
              DrawerXtile(title: "StockIN",
              onTap: (){
                Get.to(()=>StockIN());
              },
              )

            ],
          ),
        ),
      ),
    );
  }
}

class DrawerXtile extends StatelessWidget {
 final String title;
 final Function()? onTap;
  const DrawerXtile({super.key, required this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(title),
        ),
      ),
    );
  }
}
