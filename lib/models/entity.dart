// base class for things like Player and Monsters
// maybe can be for items too
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

  int attackEntity(Entity entity) {
    int damage = (this.attack - entity.defense).round();
    if (damage < 0) {
      damage = 0;
    }
    entity.health -= damage;
    if (entity.health < 0) {
      entity.health = 0;
    }

    print("${this.name} attacked ${entity.name} for $damage damage.");

    return damage;
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