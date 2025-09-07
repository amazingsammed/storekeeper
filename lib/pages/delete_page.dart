import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:storekeeper/widgets/exceptions.dart';

import '../../controlleers/mystore.dart';
import '../../models/item_model.dart';
import '../../widgets/containers.dart';

class DeletePage extends StatelessWidget {
 final MyStore _myStore = Get.put(MyStore());
  DeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Item'),
      ),
      body: Obx(() {
        if (_myStore.items.value.length == 0)
          return NoItem(
            title: 'Items in Store',
          );
        return ListView.builder(
          itemCount: _myStore.items.value.length,
          itemBuilder: (BuildContext context, int index) {
            ItemClass element = _myStore.items.value[index];
            return InkWell(
              onTap: () {
                Get.bottomSheet(
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'Delete this item below',
                            style: TextStyle(fontSize: 24),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(element.name),
                              leading: CircleAvatar(
                                backgroundImage: appImage(element.image),
                              ),
                              subtitle: Text("${element.avaliable} avaliable"),
                            ),
                          ),
                          Row(
                            children: [
                              ContainerWithTextCentered(
                                width: 120,
                                ontap: () {
                                  Get.back(closeOverlays: true);
                                },
                                text: 'Cancel',
                                bgColor: Colors.green,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ContainerWithTextCentered(
                                width: 120,
                                text: 'Delete',
                                bgColor: Colors.red,
                                ontap: () {
                                  _myStore.deleteItemfromDB(element);
                                  Get.back();
                                },
                              ),
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
              },
              child: ListTile(
                title: Text(element.name),
                leading: CircleAvatar(
                  backgroundImage: appImage(element.image),
                ),
                subtitle: Text("${element.avaliable} avaliable"),
              ),
            );
          },
        );
      }),
    );
  }
}
