import 'package:zeldalike/models/entity.dart';

class Battle {
  Monster monster;
  int level;
  Battle(this.monster, this.level) {
    monster.setLevel(level);
  }
}