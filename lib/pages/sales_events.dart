import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:storekeeper/controlleers/mystore.dart';

import '../../models/sales_model.dart';
import '../../widgets/exceptions.dart';

class SalesEvent extends StatelessWidget {
  MyStore mystore = Get.put(MyStore());

  SalesEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events on Sales'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Obx(() {
          if (mystore.sales.value.length == 0)
            return NoItem(
              title: 'Sales Event',
            );
          return ListView.builder(
            itemCount: mystore.sales.value.length,
            itemBuilder: (BuildContext context, int index) {
              Sales item = mystore.sales.value[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(item.quantity),
                ),
                title: Text(item.name.toString()),
                subtitle: Text(item.date),
                trailing: Text(item.total),
              );
            },
          );
        }),
      ),
    );
  }
}
