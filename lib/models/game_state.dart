import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zeldalike/models/event.dart';
import 'package:zeldalike/models/item.dart';
import 'package:zeldalike/models/scene.dart';
import 'package:zeldalike/models/shop.dart';
import 'package:zeldalike/models/world_node.dart';


List events = [
  Event("Event Text 1... Something good happens to you.", [EventChoice("Okay.", "You found some money.", (GameState s) => s.money += 100)]),
  Event("Event Text 2... Something bad happens to you.", [EventChoice("Okay.", "You lost some money.", (GameState s) => s.money -= 100)]),
  Event("Event Text 3... Something good and bad happens to you.", [EventChoice("Good.", "You found some money.", (GameState s) => s.money += 100), EventChoice("Bad.", "You lost some money.", (GameState s) => s.money -= 100)]),
  Event("Event Text 4... A clown dances in front of you.", [EventChoice("Acknowledge their existence.", "They give you some money.", (GameState s) => s.money += 100)]),
  Event("Event Text 5... You get lost in a corn maze of twisty little passages, all alike.", [EventChoice("Okay.", "You lost some money.", (GameState s) => s.money -= 100)]),
];

List items = <Item>[
  Potion("Health Potion", "Will heal whoever uses it by 50 health.", 50, 100, 50)
];

Shop shop1 = Shop([InventorySlot(items[0], items[0].getPrice())]);

Event getEvent() {
  return events[Random().nextInt(events.length)];
}

class GameState extends ChangeNotifier {
  int currentLevel = 0;
  List<List<WorldNode>> worldNodes = [
    [WorldNode(BattleScene())],
    [WorldNode(BattleScene()), WorldNode(EventScene(getEvent()))],
    [WorldNode(BattleScene()), WorldNode(ShopScene(shop1))],
    [WorldNode(BattleScene()), WorldNode(EventScene(getEvent())), WorldNode(ShopScene(shop1))],
    [WorldNode(BattleScene())],
  ];
  Scene? currentScene;
  int money = 0;

  List inventory = <Item>[];

  void increaseLevel() {
    currentLevel++;
    notifyListeners();
  }

  void addItemToInventory(Item item) {
    inventory.add(item);
    notifyListeners();
  }
}


