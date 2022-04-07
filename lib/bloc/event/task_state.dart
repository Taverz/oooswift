

abstract class StateEvent {}

class InitStateEvent extends StateEvent{
  List list;
  InitStateEvent(this.list);
}