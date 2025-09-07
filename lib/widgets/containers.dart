import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWithIconCentered extends StatelessWidget {
  final IconData icon;
 final Color bgColor;
 final Function()? ontap;
  const ContainerWithIconCentered(
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
final  String text;
final  Function()? ontap;
final  double? height;
final  double? width;

 final Color? bgColor;
  const ContainerWithTextCentered(
      {super.key,
      required this.text,
      this.bgColor = Colors.purple,
      this.ontap,
      this.height = 50,
      this.width});

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
