import 'package:flutter/material.dart';
import 'package:new_project/ui/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}
