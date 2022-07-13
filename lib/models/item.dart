import 'dart:math';

import 'package:zeldalike/models/entity.dart';

abstract class Item {
  String name;
  String description;

  // min and max are inclusive
  int minPrice;
  int maxPrice;
  
  Item(this.name, this.description, this.minPrice, this.maxPrice);

  void use(Entity e);

  int getPrice() {
    return Random().nextInt(maxPrice - minPrice) + minPrice;
  }
}

class Potion extends Item {
  int health;
  
  Potion(String name, String description, int minPrice, int maxPrice, this.health) : super(name, description, minPrice, maxPrice);
  
  @override
  void use(Entity e) {
    e.health = min(e.maxHealth, e.health + health);
  }
}

class Bow extends Item {
  int health;

  Bow(String name, String description, int minPrice, int maxPrice, this.health) : super(name, description, minPrice, maxPrice);

  @override
  void use(Entity e) {
    e.health = min(e.maxHealth, e.health + health);
  }
}

class Boomerang extends Item {
  int health;

  Boomerang(String name, String description, int minPrice, int maxPrice, this.health) : super(name, description, minPrice, maxPrice);

  @override
  void use(Entity e) {
    e.health = min(e.maxHealth, e.health + health);
  }
}

class Claw extends Item {
  int health;

  Claw(String name, String description, int minPrice, int maxPrice, this.health) : super(name, description, minPrice, maxPrice);

  @override
  void use(Entity e) {
    e.health = min(e.maxHealth, e.health + health);
  }
}

class Wand extends Item {
  int health;

  Wand(String name, String description, int minPrice, int maxPrice, this.health) : super(name, description, minPrice, maxPrice);

  @override
  void use(Entity e) {
    e.health = min(e.maxHealth, e.health + health);
  }
}




