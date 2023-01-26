import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_project/domain/serial_notifier.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SerialNotifier>(builder: (context, state, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Корзина'),
        ),
        body: ListView.builder(
          itemCount: state.cards.length,
          itemBuilder: ((context, index) {
            return Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.3,
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: ((context) {
                      state.deleteOneSerialToCard(index);
                    }),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.remove,
                  ),
                ],
              ),
              child: Card(
                color: (index % 2 == 0)
                    ? Colors.blueGrey[50]
                    : Colors.blueGrey[100],
                child: Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                            'assets/images/${state.cards[index].id + 1}.gif')),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              state.cards[index].title,
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
                                state.cards[index].price.toString(),
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
        ),
        bottomNavigationBar: Container(
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
                        (state.cards.isEmpty)
                            ? '0'
                            : state.cards.length.toString(),
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
                    state.deleteAllSerialToCard();
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
        ),
      );
    });
  }
}
