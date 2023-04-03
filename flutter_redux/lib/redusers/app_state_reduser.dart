import 'package:new_project/models/app_state.dart';
import 'package:new_project/redusers/card_reduser.dart';
import 'package:new_project/redusers/loading_reduser.dart';
import 'package:new_project/redusers/serials_reduser.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    serials: serialsReducer(state.serials, action),
    card: cardReducer(state.card, action),
  );
}
