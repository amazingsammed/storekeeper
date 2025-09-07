import 'package:flutter/material.dart';
import 'package:storekeeper/authentication/signup_page.dart';
import 'package:get/get.dart';

import '../pages/cart_page.dart';

class LoginPage extends StatelessWidget {
 final TextEditingController email = TextEditingController();
final  TextEditingController username = TextEditingController();
final  TextEditingController password = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey_10,
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        title: Text('SignIn'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topCenter,
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
                  Text("Account Information",
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
                        controller: email,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(-12),
                            border: InputBorder.none,
                            hintText: "Email",
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
                        controller: username,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(-12),
                            border: InputBorder.none,
                            hintText: "Username",
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
                        controller: password,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(-12),
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: MyText.body1(context)!
                                .copyWith(color: MyColors.grey_40)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 25),
              Container(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: MyText.subhead(context)!
                          .copyWith(color: MyColors.grey_60)),
                  InkWell(
                    onTap: () {
                      Get.off(() => SignupPage());
                    },
                    child: Text("Sign Up",
                        style: MyText.subhead(context)!.copyWith(
                            color: Colors.teal, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "fab2",
        backgroundColor: Colors.deepPurple[700],
        elevation: 3,
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(()=>CartPage());
        },
      ),
    );
  }
}
