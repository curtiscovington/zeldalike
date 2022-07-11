import 'package:flutter/material.dart';

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
}

// battle scene
class BattleScene extends Scene {
  BattleScene() {

  }

  // get icon method
  @override
  Icon getIcon() {
    return const Icon(Icons.alarm);
  }

  @override
  String getName() {
    return "battle";
  }
}

// shop scene
class ShopScene extends Scene {
  ShopScene() {

  }

  // get icon method
  @override
  Icon getIcon() {
    return const Icon(Icons.store);
  }

  @override
  String getName() {
    return "shop";
  }
}

// event scene
class EventScene extends Scene {
  EventScene() {

  }

  // get icon method
  @override
  Icon getIcon() {
    return const Icon(Icons.event_available);
  }

  @override
  String getName() {
    return "event";
  }
}