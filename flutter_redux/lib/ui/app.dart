import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:new_project/data/repository/serial_repository.dart';

import 'package:new_project/models/app_state.dart';
import 'package:new_project/ui/screen/card_page.dart';
import 'package:new_project/ui/screen/home_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/actions.dart';

class App extends StatelessWidget {
  final Store<AppState> store;
  const App({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter State Management',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomePage(),
        routes: {
          'ui/pages/card_page': (context) => const CardPage(),
        },
        initialRoute: 'ui/pages/home_page',
      ),
    );
  }
}
