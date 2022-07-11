import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeldalike/models/scene.dart';
import 'package:zeldalike/models/world_node.dart';
 
// a list of world nodes
List<List<WorldNode>> worldNodes = [
  [WorldNode(BattleScene())],
  [WorldNode(BattleScene()), WorldNode(EventScene())],
  [WorldNode(BattleScene()), WorldNode(ShopScene())],
  [WorldNode(BattleScene()), WorldNode(EventScene()), WorldNode(ShopScene())],
  [WorldNode(BattleScene())],
];

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  int currentLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: mapNodesBuilder, itemCount: worldNodes.length),
    );
  }


  Widget mapNodesBuilder(context, index) {
    List<WorldNode> nodes = worldNodes[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          for (WorldNode node in nodes)
            Expanded(
              child: Container(
                color: currentLevel == index ? Colors.blue : Colors.grey,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: IconButton(
                    icon: node.scene!.getIcon(),
                    onPressed: () {
                      if (node.scene != null && currentLevel == index) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => node.scene!.buildScene(context),
                          ),
                        );
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