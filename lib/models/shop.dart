import 'package:zeldalike/models/item.dart';

class Shop {
  List<InventorySlot> inventorySlots;
  
  Shop(this.inventorySlots);
}

class InventorySlot {
  Item item;
  int price;
  bool sold = false;
  InventorySlot(this.item, this.price);

  void sell() {
    sold = true;
  }
}