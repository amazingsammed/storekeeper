import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storekeeper/master.dart';
import 'package:storekeeper/pages/cart_page.dart';
import '../../controlleers/mystore.dart';
import '../../models/item_model.dart';
import '../../widgets/containers.dart';
import '../../widgets/exceptions.dart';
import '../../widgets/textfieldc.dart';

class EditItemPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController actualprice = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController avaliable = TextEditingController();
  MyStore provider = Get.find();
  ItemClass item;
  EditItemPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    actualprice.text = item.actualprice;
    price.text = item.price;
    provider.image.value = item.image;
    total.text = item.total.toString();
    name.text = item.name;
    avaliable.text = item.avaliable.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 140,
                        child: Column(
                          children: [
                            ContainerWithTextCentered(
                              text: 'Pick Image from camera',
                              height: 50,
                              width: 200,
                              ontap: () async {
                                provider.gallery.value = false;
                                provider.image.value = await getImageAndSave(
                                    gallery: provider.gallery.value);
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ContainerWithTextCentered(
                              text: 'Pick Image from gallery',
                              height: 50,
                              width: 200,
                              ontap: () async {
                                provider.gallery.value = true;
                                provider.image.value = await getImageAndSave(
                                    gallery: provider.gallery.value);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12))));
                },
                child: Obx(() {
                  return CircleAvatar(
                    backgroundImage: appImage(provider.image.value.toString()),
                    radius: 50,
                  );
                }),
              ),
              CustomTextfield(
                label: 'Item Name',
                controller: name,
              ),
              CustomTextfield(
                label: 'Price',
                keyboardtype: TextInputType.number,
                controller: price,
              ),
              CustomTextfield(
                label: 'Actual Price',
                keyboardtype: TextInputType.number,
                controller: actualprice,
              ),
              CustomTextfield(
                label: 'Items Avaliable',
                keyboardtype: TextInputType.number,
                controller: avaliable,
              ),
              CustomTextfield(
                label: 'total items',
                keyboardtype: TextInputType.number,
                controller: total,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 110,
                child: ContainerWithTextCentered(
                  text: 'Update',
                  ontap: () async {
                    if (CheckText(name.text) &&
                        CheckText(total.text) &&
                        CheckText(actualprice.text) &&
                        CheckText(price.text) &&
                        CheckText(provider.image.value.toString())) {
                      ItemClass itemValue = ItemClass(
                          id: item.id,
                          image: provider.image.value.toString(),
                          name: name.text,
                          price: price.text,
                          categoryid: item.categoryid,
                          actualprice: actualprice.text,
                          date: DateTime.now().toString(),
                          storeid: item.storeid,
                          avaliable: int.parse(avaliable.text),
                          total: int.parse(total.text));
                      await provider.updateIteminDB(itemValue);
                      Get.offAll(()=>CartPage());
                    } else {
                      Get.defaultDialog(
                          middleText: "Don't leave any field empty");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
