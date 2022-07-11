import 'package:flutter/material.dart';
import 'package:zeldalike/models/battle.dart';
import 'package:zeldalike/models/event.dart';
import 'package:zeldalike/models/shop.dart';

class Scene {
  Scene() {

  }

  // get icon method
  Icon getIcon() {
    return const Icon(Icons.home);
  }

  String getName() {
    return "Scene";
  }

  buildScene(BuildContext context) {}

  getData() {
    return {};
  }
}

// battle scene
class BattleScene extends Scene {

  Battle data = Battle();
  BattleScene();

  // get icon method
  @override
  Icon getIcon() {
    return const Icon(Icons.alarm);
  }

  @override
  String getName() {
    return "battle";
  }

  @override
  getData() {
    return data;
  }
}

// shop scene
class ShopScene extends Scene {
  Shop data;
  ShopScene(this.data);

  // get icon method
  @override
  Icon getIcon() {
    return const Icon(Icons.store);
  }

  @override
  String getName() {
    return "shop";
  }

  @override
  getData() {
    return data;
  }
}

// event scene
class EventScene extends Scene {
  Event data;
  
  EventScene(this.data);

  // get icon method
  @override
  Icon getIcon() {
    return const Icon(Icons.event_available);
  }

  @override
  String getName() {
    return "event";
  }

  @override
  getData() {
    return data;
  }
}