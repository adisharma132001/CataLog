import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(backgroundColor: Colors.transparent,
      title: "Cart".text.make(),),
    );
  }
}