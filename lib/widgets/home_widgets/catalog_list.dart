import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/home_detail_page.dart';
import 'package:catalog/pages/home_page.dart';

import 'package:catalog/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog =CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=>HomeDetailpage(
                catalog: catalog),),),
          child: CatalogItem(catalog:catalog));
      }
      );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         Hero(
           tag: Key(catalog.id.toString()),
           child: CatalogImage(image: catalog.image)),
         Expanded(child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             catalog.name.text.lg.color(MyTheme.darkbluish).bold.make(),
             catalog.desc.text.make(),
             10.heightBox,
             ButtonBar(
               alignment: MainAxisAlignment.spaceBetween,
               buttonPadding: EdgeInsets.zero,
               children:[
               "\$${catalog.price}".text.bold.xl.make(),
               ElevatedButton(onPressed:() {},
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(MyTheme.darkbluish),
                 shape:MaterialStateProperty.all(StadiumBorder())
               ),
                child: "Buy".text.make())
             ]).pOnly(right:8.0)
         ],))
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
    
  }
}