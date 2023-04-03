import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:new_project/actions/actions.dart' as Actions;
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/models/app_state.dart';
import 'package:new_project/ui/screen/home_page.dart';
import 'package:redux/redux.dart';

class SerialsContainer extends StatelessWidget {
  SerialsContainer({
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
        return SerialsList(
          serials: vm.serials,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Serial> serials;
  final bool loading;

  _ViewModel({
    required this.serials,
    required this.loading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      serials: store.state.serials.toList(),
      loading: store.state.isLoading,
    );
  }
}
