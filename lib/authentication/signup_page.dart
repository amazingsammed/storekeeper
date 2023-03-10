import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:storekeeper/authentication/signIn_page.dart';

import '../pages/cart_page.dart';

class SignupPage extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retype_password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController storename = TextEditingController();
  TextEditingController storelocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey_10,
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        brightness: Brightness.dark,
        title: Text('SignUp'),
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
                          obscureText: true,
                          controller: password,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Password",
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
                          obscureText: true,
                          controller: retype_password,
                          decoration: InputDecoration(

                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Re-type Password",
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
                          controller: phone,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Phone",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 25),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red[400]),
                    ),
                    Container(width: 15),
                    Text("Store Information",
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
                          controller: storename,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                              hintText: "Store Name",
                              hintStyle: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_40)),
                        ),
                      ),
                      Divider(height: 0),
                      Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: <Widget>[
                            Container(width: 15),
                            Expanded(
                              child: TextField(
                                maxLines: 1,
                                controller: storelocation,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(-12),
                                    border: InputBorder.none,
                                    hintText: "Store Location",
                                    hintStyle: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: MyText.subhead(context)!
                            .copyWith(color: MyColors.grey_60)),
                    InkWell(
                      onTap: () {
                        Get.off(() => LoginPage());
                      },
                      child: Text("Sign In",
                          style: MyText.subhead(context)!.copyWith(
                              color: Colors.teal, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ],
            ),
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
          print('Clicked');
          Get.to(()=>CartPage());
        },
      ),
    );
  }
}

class MyText {
  static TextStyle? display4(BuildContext context) {
    return Theme.of(context).textTheme.headline1;
  }

  static TextStyle? display3(BuildContext context) {
    return Theme.of(context).textTheme.headline2;
  }

  static TextStyle? display2(BuildContext context) {
    return Theme.of(context).textTheme.headline3;
  }

  static TextStyle? display1(BuildContext context) {
    return Theme.of(context).textTheme.headline4;
  }

  static TextStyle? headline(BuildContext context) {
    return Theme.of(context).textTheme.headline5;
  }

  static TextStyle? title(BuildContext context) {
    return Theme.of(context).textTheme.headline6;
  }

  static TextStyle medium(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
          fontSize: 18,
        );
  }

  static TextStyle? subhead(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1;
  }

  static TextStyle? body2(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1;
  }

  static TextStyle? body1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2;
  }

  static TextStyle? caption(BuildContext context) {
    return Theme.of(context).textTheme.caption;
  }

  static TextStyle? button(BuildContext context) {
    return Theme.of(context).textTheme.button!.copyWith(letterSpacing: 1);
  }

  static TextStyle? subtitle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2;
  }

  static TextStyle? overline(BuildContext context) {
    return Theme.of(context).textTheme.overline;
  }
}

class MyColors {
  static const Color primary = Color(0xFF1976D2);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF1E88E5);
  static const Color accent = Color(0xFFFF4081);
  static const Color accentDark = Color(0xFFF50057);
  static const Color accentLight = Color(0xFFFF80AB);

  static const Color grey_3 = Color(0xFFf7f7f7);
  static const Color grey_5 = Color(0xFFf2f2f2);
  static const Color grey_10 = Color(0xFFe6e6e6);
  static const Color grey_20 = Color(0xFFcccccc);
  static const Color grey_40 = Color(0xFF999999);
  static const Color grey_60 = Color(0xFF666666);
  static const Color grey_80 = Color(0xFF37474F);
  static const Color grey_90 = Color(0xFF263238);
  static const Color grey_95 = Color(0xFF1a1a1a);
  static const Color grey_100_ = Color(0xFF0d0d0d);
}
