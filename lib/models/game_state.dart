import 'package:flutter/material.dart';
import 'package:zeldalike/models/scene.dart';
import 'package:zeldalike/models/world_node.dart';

class GameState extends ChangeNotifier {
  int currentLevel = 0;
  List<List<WorldNode>> worldNodes = [
    [WorldNode(BattleScene())],
    [WorldNode(BattleScene()), WorldNode(EventScene())],
    [WorldNode(BattleScene()), WorldNode(ShopScene())],
    [WorldNode(BattleScene()), WorldNode(EventScene()), WorldNode(ShopScene())],
    [WorldNode(BattleScene())],
  ];

  void increaseLevel() {
    currentLevel++;
    notifyListeners();
  }
}