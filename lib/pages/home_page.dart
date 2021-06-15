import 'dart:html';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'dart:convert';
import 'package:catalog/widgets/item_widget.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

String velocityx() => "package:velocity_x/velocity_x.dart";


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days =30;

  final String name="codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    print(productData);
    CatalogModel.items= List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: Container(
              padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CatalogHeader(),
              if(CatalogModel.items!=null&& CatalogModel.items.isNotEmpty)
              CatalogList()
              else
                Center(child: CircularProgressIndicator(),)
            ]
            ,),
          ),
        )
      );
  }
}



class CatalogHeader extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              "Catalog App".text.xl5.bold.color(MyTheme.darkbluish).make(),
              "Trending Products".text.xl2.make(),
            ],
            );
  }
}




class CatalogList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog =CatalogModel.items[index];
        return CatalogItem(catalog);
      }
      );
  }
}