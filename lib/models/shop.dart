import 'package:zeldalike/models/item.dart';

class Shop {
  List inventorySlots = <InventorySlot>[];
  
  Shop(this.inventorySlots);
}

class InventorySlot {
  Item item;
  int price;
  InventorySlot(this.item, this.price);
}