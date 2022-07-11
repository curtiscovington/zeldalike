import 'package:zeldalike/models/game_state.dart';

class Event {
  String text;
  List<EventChoice> choices = [];
  Event(this.text, this.choices);
}

class EventChoice {
  String text;
  String outcome;
  Function onSelect;

  EventChoice(this.text, this.outcome, this.onSelect);
  
  void select(GameState s) {
    onSelect(s);
  }
}
