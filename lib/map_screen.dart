import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:zeldalike/models/game_state.dart';
import 'package:zeldalike/models/scene.dart';
import 'package:zeldalike/models/world_node.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  bool _gameOver = false;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        body: _gameOver ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [const Text("Game Over."), TextButton(onPressed: () { Navigator.of(context).pop(); }, child: const Text("Done"))],)) : listView(context),
        );
  }

  Widget listView(context) {
    return Consumer<GameState>(
      builder: (context, state, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return mapNodesBuilder(context, index, state);
          },
          itemCount: state.worldNodes.length,
        );
      });
  }


  Widget mapNodesBuilder(context, index, state) {
    List<WorldNode> nodes = state.worldNodes[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          for (WorldNode node in nodes)
            Expanded(
              child: Container(
                color: state!.currentLevel == index ? Colors.blue : Colors.grey,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: IconButton(
                    icon: node.scene!.getIcon(),
                    onPressed: () {
                      if (node.scene != null && state!.currentLevel == index) {
                        // push for result of the scene.getName
                        Navigator.pushNamed(context, "/${node.scene!.getName()}", arguments: node.scene!.getData()).then((value) {
                          // increase level 
                          state.increaseLevel();
                          if (state.currentLevel > state.worldNodes.length - 1) {
                            state.currentLevel = 0;
                            setState(() {
                              _gameOver = true;
                            });
                          }
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
    return ListTile(
      title: Text('$index'),
    );
  }
}