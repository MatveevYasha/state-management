import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:new_project/models/app_state.dart';
import 'package:redux/redux.dart';

class AppLoading extends StatelessWidget {
  final Widget Function(BuildContext context, bool isLoading) builder;

  AppLoading({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, bool>(
        distinct: true,
        converter: (Store<AppState> store) => store.state.isLoading,
        builder: builder,
      );
}
