import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:zeldalike/models/game_state.dart';
import 'package:zeldalike/models/item.dart';
import 'package:zeldalike/models/shop.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Shop;
    
    // create a list from the shop's items
    List<Widget> items = [];
    for (InventorySlot slot in args.inventorySlots) {
      items.add(ListTile(
        title: Text(slot.item.name),
        subtitle: Text(slot.item.description),
        trailing: Text("${slot.price}"),
        onTap: () {
          // buy the item
          // check if the player has enough money

          // if they do, remove the money from the player's inventory
          // and add the item to the player's inventory
          
        },
      ));
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Shop"),
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Done")),
            Expanded(
              child: ListView(
                children: items,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listView(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Shop;
    return Consumer<GameState>(
      builder: (context, state, child) => ListView(
        children: [
          for (InventorySlot slot in args.inventorySlots)
            ListTile(
              title: Text(slot.item.name),
              subtitle: Text(slot.item.description),
              trailing: Text("${slot.price}"),
              onTap: () {
                // buy the item
                // check if the player has enough money
    
                // if they do, remove the money from the player's inventory
                // and add the item to the player's inventory
                state.addItemToInventory(slot.item);
              },
            ),
        ],
      ),
    );
  }
}