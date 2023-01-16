import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {}),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: ListTile(
          title: Text('TITLE'),
          subtitle: Text('subtitle'),
          leading: Text('leading'),
        ),
      ),
    );
  }
}
