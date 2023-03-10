

import 'package:flutter/material.dart';

import '../authentication/signup_page.dart';

class StockIN extends StatelessWidget {

  StockIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey_10,
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        title: Text('Stock In'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(height: 5),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red[400]),
                    ),
                    Container(width: 15),
                    Text("Stock Information",
                        style: MyText.subhead(context)!
                            .copyWith(color: MyColors.grey_80))
                  ],
                ),
                Container(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 1,
                  margin: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Invoice Number if any",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                      Divider(height: 0),
                      Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Quantity",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                      Divider(height: 0),
                      Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Purchase price",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                      Divider(height: 0),
                      Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Supplier Name if any",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                      Divider(height: 0),
                    ],
                  ),
                ),
                Container(height: 25),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
