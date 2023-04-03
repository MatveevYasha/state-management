import 'package:new_project/data/models/serial.dart';

abstract class Action {}

abstract class SerialsAction extends Action {}

class LoadSerialsAction extends SerialsAction {}

class SerialsNotLoadedAction extends SerialsAction {}

class SerialsLoadedAction extends SerialsAction {
  final List<Serial> serials;

  SerialsLoadedAction(this.serials);
}

class AddSerialToCard extends SerialsAction {
  final int index;

  AddSerialToCard(this.index);
}

class RemoveOneSerialToCard extends SerialsAction {
  final int index;

  RemoveOneSerialToCard(this.index);
}

class RemoveAllSerialToCard extends SerialsAction {}
