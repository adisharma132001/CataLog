import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days =30;
  final String name="codepur";

  @override
  Widget build(BuildContext context) {
    final dummyList= List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        
        
        title: Text("Catalog App",),
        ),
        body:Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder( 
          itemCount: dummyList.length,
          itemBuilder: (context,index){
            return ItemWidget(item: dummyList[index],
            );
          },
          ),
        ),
      drawer: MyDrawer(),
      );
  }
}