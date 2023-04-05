import 'package:new_project/actions/actions.dart';
import 'package:new_project/data/repository/serial_repository.dart';
import 'package:new_project/models/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware([
  SerialRepository serialsRepo = const ConstSerialsRepository(),
]) {
  // final saveSpeakers = _createSaveSpeakers(speakersRepo);
  final loadSerials = _createLoadSerials(serialsRepo);

  return [
    TypedMiddleware<AppState, LoadSerialsAction>(loadSerials),
    // TypedMiddleware<AppState, UpdateSpeakerAction>(saveSpeakers),
    // TypedMiddleware<AppState, LoadTalksAction>(loadTalks),
    // TypedMiddleware<AppState, UpdateSpeakerAction>(saveTalks),
  ];
}

// Middleware<AppState> _createSaveSpeakers(SpeakersRepository repository) {
//   return (Store<AppState> store, action, NextDispatcher next) {
//     next(action);

//     repository.saveSpeakers(
//       store.state.speakers,
//     );
//   };
// }

Middleware<AppState> _createLoadSerials(SerialRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository
        .loadSerial()
        .then((serials) => store.dispatch(
              SerialsLoadedAction(
                serials,
              ),
            ))
        .catchError((_) => store.dispatch(SerialsNotLoadedAction()));

    next(action);
  };
}
