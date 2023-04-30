// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_project/containers/card_container.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/data/models/state/serials_state.dart';
import 'package:new_project/models/app_state.dart';
import 'package:redux/src/store.dart';
import 'package:new_project/actions/actions.dart' as Actions;

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: CardsContainer(),
      bottomNavigationBar: MyBottomNavigationBar(store: store),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.store,
  });

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: 120,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Количество товаров в корзине:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Text(
                    (store.state.card.isEmpty)
                        ? '0'
                        : store.state.card.length.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    'шт.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                print(store.state.card);
                store.dispatch(Actions.RemoveAllSerialToCard);
                // store.dispatch(Actions.AddSerialToCard(index, serials));
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'Clean',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  List<Serial> card;
  CardList({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return ListView.builder(
      itemCount: store.state.card.length,
      itemBuilder: ((context, index) {
        return Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: ((context) {
                  // context.read<SerialsCubit>().removeOneSerialToCard(index);
                }),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.remove,
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
                        'assets/images/${store.state.card[index].id + 1}.gif')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          store.state.card[index].title,
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
                            store.state.card[index].price.toString(),
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
