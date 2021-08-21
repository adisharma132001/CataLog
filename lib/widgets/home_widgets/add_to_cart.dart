import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
   AddtoCart({
    Key? key, required this.catalog,
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart= _cart.items.contains(catalog);
    return ElevatedButton(onPressed:() {
      if(!isInCart){
      AddMutation(catalog);
      }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
      shape:MaterialStateProperty.all(StadiumBorder())
    ),
     child: isInCart? Icon(Icons.done) :  Icon(CupertinoIcons.cart_badge_plus),
     );
  }
}