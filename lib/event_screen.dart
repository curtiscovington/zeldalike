import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:zeldalike/models/event.dart';
import 'package:zeldalike/models/game_state.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool showOutcome = false;
  String outcome = "";
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Event;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: !showOutcome ? [
            Text(args.text),
            buildChoiceList(context, args.choices)
          ] : [
            Text(outcome),
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: const Text("Done...")),
          ],
        ),
      ),
    );
  }

  Widget buildChoiceList(BuildContext context, List<EventChoice> choices) {
    return Consumer<GameState>(builder: ((context, state, child) => Column(
      children: choices.map((choice) {
        return ListTile(
          title: Text(choice.text),
          onTap: () {
            choice.select(state);
            setState(() {
              showOutcome = true;
              outcome = choice.outcome;
            });
          },
        );
      }).toList(),
    )));
  }
}