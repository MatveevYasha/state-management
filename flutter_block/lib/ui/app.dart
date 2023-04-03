import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/data/repository/serial_repository.dart';
import 'package:new_project/domain/serial_notifier.dart';
import 'package:new_project/ui/screen/card_page.dart';
import 'package:new_project/ui/screen/home_page.dart';
import 'package:provider/provider.dart';

import '../actions/actions.dart';
import '../blocks/serials_block.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const serialsRepo = ConstSerialsRepository();
    return BlocProvider<SerialsBloc>(
      create: (BuildContext context) =>
          SerialsBloc(serialsRepo)..add(LoadSerialsAction()),
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
