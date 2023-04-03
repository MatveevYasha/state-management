import 'package:new_project/actions/actions.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:redux/redux.dart';

final serialsReducer = combineReducers<List<Serial>>([
  // TypedReducer<List<Serial>, UpdateSpeakerAction>(_updateSpeaker),
  TypedReducer<List<Serial>, SerialsLoadedAction>(_setLoadedSerials),
  TypedReducer<List<Serial>, SerialsNotLoadedAction>(_setNoSerials),
]);

// List<Serial> _updateSpeaker(List<Serial> speakers, UpdateSpeakerAction action) {
//   return speakers
//       .map((speaker) =>
//           speaker.id == action.id ? action.updatedSpeaker : speaker)
//       .toList();
// }

List<Serial> _setLoadedSerials(
    List<Serial> serials, SerialsLoadedAction action) {
  return action.serials;
}

List<Serial> _setNoSerials(
    List<Serial> serials, SerialsNotLoadedAction action) {
  return [];
}
