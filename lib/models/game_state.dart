import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zeldalike/models/event.dart';
import 'package:zeldalike/models/scene.dart';
import 'package:zeldalike/models/world_node.dart';


List events = [
  Event("Event Text 1... Something good happens to you."),
  Event("Event Text 2... Something bad happens to you."),
  Event("Event Text 3... Something good and bad happens to you."),
  Event("Event Text 4... A clown dances in front of you."),
  Event("Event Text 5... You get lost in a corn maze of twisty little passages, all alike."),
];

Event getEvent() {
  return events[Random().nextInt(events.length)];
}

class GameState extends ChangeNotifier {
  int currentLevel = 0;
  List<List<WorldNode>> worldNodes = [
    [WorldNode(BattleScene())],
    [WorldNode(BattleScene()), WorldNode(EventScene(getEvent()))],
    [WorldNode(BattleScene()), WorldNode(ShopScene())],
    [WorldNode(BattleScene()), WorldNode(EventScene(getEvent())), WorldNode(ShopScene())],
    [WorldNode(BattleScene())],
  ];
  Scene? currentScene;

  void increaseLevel() {
    currentLevel++;
    notifyListeners();
  }
}


