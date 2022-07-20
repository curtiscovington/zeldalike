import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:zeldalike/models/battle.dart';
import 'package:zeldalike/models/game_state.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  List<String> _battleLog = [];
  bool _battleStarted = false;
  bool _battleOver = false;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Battle;
    if (!_battleStarted) {
      _battleStarted = true;
      _battleLog.add("${args.monster.name} appeared!");
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            battleLog(),
            renderMenu(context),
          ],
        ),
      ),
    );
  }

  Widget battleLog() {
    return Expanded(
      child: ListView.builder(
        itemCount: _battleLog.length,
        itemBuilder: (context, index) {
          return Text(_battleLog[index]);
        },
      ),
    );
  }

  Widget renderMenu(BuildContext context) {
    return Consumer<GameState>(builder: ((context, state, child) => Row(
      children: _battleOver ? [
        Text("HP: ${state.player.health} / ${state.player.maxHealth}"),
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: const Text("Finished")),
      ] : [
        
        TextButton(onPressed: () {
          // trade blows with the monster
          fight(context, state);
        }, child: Text("Fight")),
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("Flee")),
      ],)
    ));
  }

  void fight(BuildContext context, GameState state) {
    final args = ModalRoute.of(context)!.settings.arguments as Battle;
    // if the monster has a greater speed than the player, the monster will attack first
    if (args.monster.speed > state.player.speed) {
     
      int damage = args.monster.attackEntity(state.player);
       setState(() {
        _battleLog.add("${args.monster.name} attacks for $damage points of damage!");
      });
      if (state.player.health <= 0) {
        setState(() {
          _battleLog.add("You died!");
          _battleOver = true;
        });
      } else {
        int damage = state.player.attackEntity(args.monster);
        setState(() {
          _battleLog.add("You attack for $damage points of damage!");
        });
        if (args.monster.health <= 0) {
          setState(() {
            _battleLog.add("${args.monster.name} died!");
            int gold = args.monster.gold;
            _battleLog.add("You received $gold gold!");
            state.money += gold;
            _battleOver = true;
          });
        }
      }
    } else {
      int damage = state.player.attackEntity(args.monster);
      setState(() {
        _battleLog.add("You attack for $damage points of damage!");
      });
      if (args.monster.health <= 0) {
        setState(() {
          _battleLog.add("${args.monster.name} died!");
          int gold = args.monster.gold;
          _battleLog.add("You received $gold gold!");
          state.money += gold;
          _battleOver = true;
        });
      } else {
        int damage = args.monster.attackEntity(state.player);
        setState(() {
          _battleLog.add("${args.monster.name} attacks for $damage points of damage!");
        });
        if (state.player.health <= 0) {
          setState(() {
            _battleLog.add("You died!");
            _battleOver = true;
          });
        }
      }
    }

    
  }
}