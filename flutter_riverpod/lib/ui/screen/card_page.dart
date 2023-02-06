import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/domain/card_provider.dart';

import '../../domain/serial_provider.dart';

class CardPage extends ConsumerWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final card = ref.watch(cardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: card.length,
        itemBuilder: ((context, index) {
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    ref
                        .read(cardProvider.notifier)
                        .deleteOneSerialToCard(index);
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
                          'assets/images/${card[index].id + 1}.gif')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            card[index].title,
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
                              card[index].price.toString(),
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
                      (card.isEmpty) ? '0' : card.length.toString(),
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
                  ref.read(cardProvider.notifier).deleteAllSerialToCard();
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
  }
}
