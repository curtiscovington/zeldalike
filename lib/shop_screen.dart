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
  
  // bitmask of index for slots sold 
  int slotsSold = 0;
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Shop;
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 8.0, right: 8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [              
                Row(
                  children: [
                    Text("Money: "),
                    moneyText(),
                  ],
                ),
                Expanded(child: listView(context)),
                TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("Done")),
            ],
          ),
        ),
      ),
    );
  }

  Widget moneyText() {
    return Consumer<GameState>(builder: ((context, state, child) => Text(
      "\$${state.money}",
      style: TextStyle(fontSize: 20.0),
    )));
  }

  bool isSold (int index) {
    return (slotsSold & (1 << index)) != 0;
  }

  Widget listView(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Shop;

    return Consumer<GameState>(
      builder: (context, state, child) => ListView(
        children: getTiles(args, state),
      ),
    );
  }

  List<Widget> getTiles(Shop shop, state) {
    int idx = 0;
    return shop.inventorySlots.map((slot) {
      int index = idx;
      idx++;
      return ListTile(
              title: Text("${slot.item.name}${isSold(index) ? " (sold)" : ""}"),
              subtitle: Text(slot.item.description),
              trailing: Text("${slot.price}"),
              onTap: !isSold(index) ? () {
                // buy the item
                // check if the player has enough money
                if (state.money >= slot.price) {
                  state.money -= slot.price;
                  state.inventory.add(slot.item);
                  slot.sell();
                  print("SOLD");
                  // add the index to the bitmask
                  setState(() {
                    slotsSold |= (1 << index);
                  });
                }
                
              } : null,);
    }).toList();
  }
}