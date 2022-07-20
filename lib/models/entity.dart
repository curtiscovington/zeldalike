// base class for things like Player and Monsters
// maybe can be for items too
import 'dart:math';

class Entity {
  int level = 1;
  int health;
  int maxHealth;
  int attack;
  int defense;
  int speed;
  String name;
  String description;

  Entity(this.health, this.maxHealth, this.attack, this.defense, this.speed, this.name, this.description);

  setLevel(int level) {
    if (level < 1) {
      level = 1;
    }
    this.level = level;
    // scale health and attack based on level
    // increase max health by 10% per level
    // increase attack by 10% per level
    // increase defense by 10% per level
    // increase speed by 10% per level

    double scale = 1 + level / 10;
    this.maxHealth = (this.maxHealth * scale).round();
    this.health = this.maxHealth;
    this.attack = (this.attack * scale).round();
    this.defense = (this.defense * scale).round();
    this.speed = (this.speed * scale).round();
  }

  String attackEntity(Entity entity) {
    int damage = (this.attack - entity.defense).round();
    // add a little variation to the damage
    damage = (damage * (Random().nextDouble() * 0.2 + 0.9)).round() + 1;

    bool crit = Random().nextDouble() < 0.2;

    if (crit) {
      damage *= 2;
    }

    if (damage < 0) {
      damage = 0;
    }
    entity.health -= damage;
    if (entity.health < 0) {
      entity.health = 0;
    }

    

    
    return AttackMessageFactory.create(name, entity.name, damage, crit);
  }
}

class Player extends Entity {
  Player(int health, int maxHealth, int attack, int defense, int speed, String name, String description) : super(health, maxHealth, attack, defense, speed, name, description);
}

class Monster extends Entity {
  int gold = 0;
  Monster(int health, int maxHealth, int attack, int defense, int speed, String name, String description, int gold) : super(health, maxHealth, attack, defense, speed, name, description) {
    this.gold = gold;
  }
}

class MonsterFactory {
  static List<Monster> create() {
    return [
      Monster(100, 100, 1, 1, 1, "Goblin", "A goblin", 10),
      Monster(120, 120, 2, 2, 2, "Orc", "An orc", 20),
      Monster(130, 130, 3, 3, 3, "Troll", "A troll", 30),
      Monster(140, 140, 4, 4, 4, "Giant", "A giant", 40),
      Monster(150, 150, 5, 5, 5, "Dragon", "A dragon", 50),
    ];
  }
}

class AttackMessageFactory {
  static String create(attacker, defender, damage, crit) {
    // list of types of attack descriptions
    List<String> attackDescriptions = [
      "$attacker hit the $defender for $damage damage.",
      "$attacker attacked the $defender on the head for $damage damage.",
      "$attacker slashed the $defender on the arms for $damage damage.",
      "$attacker swept the $defender legs for $damage damage.",
    ];

    String message = attackDescriptions[Random().nextInt(attackDescriptions.length)];
    if (crit) {
      message = "$message It was a critical hit!";
    }
    return message;
  }
}