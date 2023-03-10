import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storekeeper/master.dart';
import 'package:storekeeper/models/item_model.dart';
import 'package:storekeeper/pages/cart_page.dart';
import 'package:storekeeper/widgets/containers.dart';

import '../controlleers/mystore.dart';
import '../widgets/exceptions.dart';
import '../widgets/textfieldc.dart';

class CreatePage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController actualprice = TextEditingController();
  TextEditingController total = TextEditingController();
  MyStore provider = Get.find();

  CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Item'),
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
                              text: 'Pick Image from Camera',
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
                              text: 'Pick Image from Gallery',
                              width: 200,
                              height: 50,
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
                  text: 'Save',
                  ontap: () {
                    if (CheckText(name.text) &&
                        CheckText(total.text) &&
                        CheckText(actualprice.text) &&
                        CheckText(price.text)) {
                      ItemClass itemValue = ItemClass(
                          image: provider.image.value.toString(),
                          name: name.text,
                          price: price.text,
                          categoryid: 'categoryid',
                          actualprice: actualprice.text,
                          date: DateTime.now().toString(),
                          storeid: 'storeid',
                          avaliable: int.parse(total.text),
                          total: int.parse(total.text));
                      provider.addItemtoDB(itemValue);
                      Get.offAll(() => CartPage());
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
