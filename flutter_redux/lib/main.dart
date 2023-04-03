import 'package:flutter/material.dart';
import 'package:new_project/actions/actions.dart';
import 'package:new_project/middleware/store_middleware.dart';
import 'package:new_project/models/app_state.dart';
import 'package:new_project/redusers/app_state_reduser.dart';
import 'package:new_project/ui/app.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreMiddleware(),
  );
  runApp(App(
    store: store,
  ));
}
