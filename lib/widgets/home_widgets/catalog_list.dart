import 'package:catalog/models/cart.dart';
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
             catalog.name.text.lg.color(context.accentColor).bold.make(),
             catalog.desc.text.make(),
             10.heightBox,
             ButtonBar(
               alignment: MainAxisAlignment.spaceBetween,
               buttonPadding: EdgeInsets.zero,
               children:[
               "\$${catalog.price}".text.bold.xl.make(),
               _AddtoCart(catalog:catalog)
             ]).pOnly(right:8.0)
         ],))
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
    
  }
}

class _AddtoCart extends StatefulWidget {
  final Item catalog;
  const _AddtoCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  __AddtoCartState createState() => __AddtoCartState();
}

class __AddtoCartState extends State<_AddtoCart> {
   bool isAdded= false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:() {
      isAdded =isAdded.toggle();
      final _catalog = CatalogModel();
      final _cart= CartModel();
      _cart.catalog=_catalog;
      _cart.add(widget.catalog);
      setState(() {});
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
      shape:MaterialStateProperty.all(StadiumBorder())
    ),
     child: isAdded? Icon(Icons.done) : "Add to Cart".text.make());
  }
}