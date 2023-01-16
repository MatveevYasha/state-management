import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_project/data/interface.dart';

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
        title: const Text('Список товаров'),
      ),
      body: ListView.builder(
        itemCount: Interface.id.length,
        itemBuilder: ((context, index) {
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    print('Товар добавлен в корзину');
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
                  Image.asset('assets/images/${Interface.id[index]}.gif'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Interface.title[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
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
                              Interface.price[index].toString(),
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: (Interface.price[index] < 200)
                                      ? Colors.green
                                      : Colors.black),
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
        backgroundColor: Colors.green,
        // если в корзину добавлен элемент, кнопка меняет свой цвет
        //с серого на зеленый
        onPressed: () {
          Navigator.of(context).pushNamed('ui/pages/card_page');
        },
        label: const Text('Перейти в корзину'),
      ),
    );
  }
}
