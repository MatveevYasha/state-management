import 'package:new_project/actions/actions.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/redusers/serials_reduser.dart';
import 'package:redux/redux.dart';

final cardReducer = combineReducers<List<Serial>>([
  TypedReducer<List<Serial>, AddSerialToCard>(_addSerial),
  TypedReducer<List<Serial>, RemoveOneSerialToCard>(_removeOneSerials),
  TypedReducer<List<Serial>, RemoveAllSerialToCard>(_removeAllSerials),
]);

List<Serial> _addSerial(List<Serial> serials, AddSerialToCard action) {
  List<Serial> card = [];
  action.serials.map((e) => e.id == action.index ? card.add(e) : null).toList();

  return [...serials, ...card];
}

List<Serial> _removeOneSerials(
    List<Serial> serials, RemoveOneSerialToCard action) {
  serials.removeAt(action.index);
  return serials;
}

List<Serial> _removeAllSerials(
    List<Serial> serials, RemoveAllSerialToCard action) {
  return [];
}
