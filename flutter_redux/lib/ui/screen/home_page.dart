// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_project/actions/actions.dart' as Actions;
import 'package:new_project/containers/serials_container.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/data/models/state/serials_state.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:new_project/models/app_state.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список товаров'),
      ),
      body: SerialsContainer(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor:
            (store.state.card.isEmpty) ? Colors.grey : Colors.green,
        onPressed: () {
          Navigator.of(context).pushNamed('ui/pages/card_page');
        },
        label: const Text('Перейти в корзину'),
      ),
    );
  }
}

class SerialsList extends StatelessWidget {
  List<Serial> serials;

  SerialsList({
    Key? key,
    required this.serials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return ListView.builder(
      itemCount: serials.length,
      itemBuilder: ((context, index) {
        return Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              StoreProvider(
                store: store,
                child: SlidableAction(
                  onPressed: ((context) {
                    store.dispatch(Actions.AddSerialToCard(index, serials));
                  }),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                ),
              ),
            ],
          ),
          child: Card(
            color:
                (index % 2 == 0) ? Colors.blueGrey[50] : Colors.blueGrey[100],
            child: Row(
              children: [
                ClipOval(
                    child: Image.asset(
                        'assets/images/${serials[index].id + 1}.gif')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          serials[index].title,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          softWrap: false,
                          style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            serials[index].price.toString(),
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
