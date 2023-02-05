import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/domain/serial_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serial = ref.watch(serialsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список товаров'),
      ),
      body: ListView.builder(
        itemCount: serial.length,
        itemBuilder: ((context, index) {
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    ref
                        .read(serialsProvider.notifier)
                        .addSerialToCard(serial[index]);
                  }),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
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
                          'assets/images/${serial[index].id + 1}.gif')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            serial[index].title,
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
                              serial[index].price.toString(),
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: (ref.watch(serialsProvider.notifier).cards.isNotEmpty)
            ? Colors.grey
            : Colors.green,
        onPressed: () {
          Navigator.of(context).pushNamed('ui/pages/card_page');
        },
        label: const Text('Перейти в корзину'),
      ),
    );
  }
}
