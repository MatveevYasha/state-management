import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:new_project/actions/actions.dart' as Actions;
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/models/app_state.dart';
import 'package:new_project/ui/screen/card_page.dart';
import 'package:new_project/ui/screen/home_page.dart';
import 'package:redux/redux.dart';

class CardsContainer extends StatelessWidget {
  CardsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (store) {
        store.dispatch(Actions.LoadSerialsAction());
      },
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return CardList(
          card: vm.cards,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Serial> cards;
  final bool loading;

  _ViewModel({
    required this.cards,
    required this.loading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      cards: store.state.card.toList(),
      loading: store.state.isLoading,
    );
  }
}
