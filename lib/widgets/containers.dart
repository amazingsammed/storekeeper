import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWithIconCentered extends StatelessWidget {
  IconData icon;
  Color bgColor;
  Function()? ontap;
  ContainerWithIconCentered(
      {Key? key, required this.icon, required this.bgColor, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        alignment: Alignment.center,
        height: 40,
        width: 40,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(6)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ContainerWithTextCentered extends StatelessWidget {
  String text;
  Function()? ontap;
  double? height;
  double? width;

  Color? bgColor;
  ContainerWithTextCentered(
      {Key? key,
      required this.text,
      this.bgColor = Colors.purple,
      this.ontap,
      this.height = 50,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(6)),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
