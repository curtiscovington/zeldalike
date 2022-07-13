import 'package:zeldalike/models/item.dart';

// Simple factory class to generate items
class ItemFactory {

  // Simple method to create the items and return as list
  static List<Item> create() {
    List<Item> items = [];
    items.add(Potion("Health Potion", "Will heal whoever uses it by 50 health.", 50, 100, 50));
    items.add(Bow("Bow", "Bow defense increases health by 20.", 25, 75, 20));
    items.add(Boomerang("Boomerang", "Boomerang defense increases health by 30.", 50, 100, 30));
    items.add(Wand("Wand", "Wand defense increases health by 100.", 100, 200, 100));
    items.add(Claw("Claw", "Claw defense increases health by 50.", 25, 50, 50));

    return items;

  }

}