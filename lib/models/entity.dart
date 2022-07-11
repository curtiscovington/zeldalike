// base class for things like Player and Monsters
// maybe can be for items too
class Entity {
  int health;
  int maxHealth;
  int attack;
  int defense;
  int speed;
  String name;
  String description;

  Entity(this.health, this.maxHealth, this.attack, this.defense, this.speed, this.name, this.description);
}