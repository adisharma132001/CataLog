import 'package:catalog/core/store.dart';
import 'package:catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{



  late CatalogModel _catalog;

   final List<int> _itemIds =[];
  
  // Get catalog
   CatalogModel get catalog => _catalog;

   set catalog(CatalogModel newCatalog){
     assert(newCatalog !=null);
     _catalog = newCatalog;
   }  
  // get Items in cart
   List<Item> get items => _itemIds.map((id)=>_catalog.getById(id)).toList();

   // get total price 
   num get totalPrice => items.fold(0, (total, current) => total+current.price);

    // Add Item
    void add(Item item){
      _itemIds.add(item.id);

    }


}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
   store!.cart._itemIds.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
   store!.cart._itemIds.remove(item.id);
  }

}