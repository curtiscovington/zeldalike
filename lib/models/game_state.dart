import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zeldalike/models/battle.dart';
import 'package:zeldalike/models/entity.dart';
import 'package:zeldalike/models/event.dart';
import 'package:zeldalike/models/item.dart';
import 'package:zeldalike/models/scene.dart';
import 'package:zeldalike/models/shop.dart';
import 'package:zeldalike/models/world_node.dart';
import 'package:zeldalike/factory/item_factory.dart';


// events are things that can happen when a random event occurs
// they are some colorful text description followed by a list of choices
// each choice can affect the game state in some way
// such as giving the player money, stats, maybe adding an item to the inventory
List events = [
  Event("Event Text 1... Something good happens to you.", [EventChoice("Okay.", "You found some money.", (GameState s) => s.money += 100)]),
  Event("Event Text 2... Something bad happens to you.", [EventChoice("Okay.", "You lost some money.", (GameState s) => s.money -= 100)]),
  Event("Event Text 3... Something good and bad happens to you.", [EventChoice("Good.", "You found some money.", (GameState s) => s.money += 100), EventChoice("Bad.", "You lost some money.", (GameState s) => s.money -= 100)]),
  Event("Event Text 4... A clown dances in front of you.", [EventChoice("Acknowledge their existence.", "They give you some money.", (GameState s) => s.money += 100)]),
  Event("Event Text 5... You get lost in a corn maze of twisty little passages, all alike.", [EventChoice("Okay.", "You lost some money.", (GameState s) => s.money -= 100)]),
];


// Monsters
List<Monster> monsters = MonsterFactory.create();

// get the items from item factory
List items = ItemFactory.create();

// generate slots. This probably should be on factory too?
Shop shop1 = Shop(setInventorySlots(items));

List<InventorySlot> setInventorySlots(items) {

  List<InventorySlot> inventoryslots = [];
  for (Item item in items) {
    inventoryslots.add( InventorySlot(item, item.getPrice() ));
  }
  return inventoryslots;
}


Event getEvent() {
  return events[Random().nextInt(events.length)];
}

Monster getMonster() {
  return monsters[Random().nextInt(monsters.length)];
}

class GameState extends ChangeNotifier {

  static final GameState _instance = GameState();
  static GameState get instance => _instance;

  int currentLevel = 0;
  List<List<WorldNode>> worldNodes = [
    [WorldNode(BattleScene(Battle(getMonster(), 1)))],
    [WorldNode(BattleScene(Battle(getMonster(), 2))), WorldNode(EventScene(getEvent()))],
    [WorldNode(BattleScene(Battle(getMonster(), 3))), WorldNode(ShopScene(shop1))],
    [WorldNode(BattleScene(Battle(getMonster(), 4))), WorldNode(EventScene(getEvent())), WorldNode(ShopScene(shop1))],
    [WorldNode(BattleScene(Battle(getMonster(), 5)))],
  ];
  Scene? currentScene;
  int money = 0;
  Player player = Player(100, 100, 10, 10, 10, "Player", "You are a player.");

  List inventory = <Item>[];

  void increaseLevel() {
    currentLevel++;
    notifyListeners();
  }

  void addItemToInventory(Item item) {
    inventory.add(item);
    notifyListeners();
  }

  updatePlayerStats(int health, int maxHealth, int attack, int defense, int speed) {
    player.health = health;
    notifyListeners();
  }
}


