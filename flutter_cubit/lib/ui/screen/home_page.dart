import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_project/cubit/serials_block.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/data/models/state/serials_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<SerialsCubit>().loadSerial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SerialsCubit, SerialsState>(
      builder: (context, state) {
        // context.read<SerialsCubit>().loadSerial();
        // if (state.isLoading == false) {
        //   return const Material(
        //       child: Center(child: CircularProgressIndicator()));
        // }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Список товаров'),
          ),
          body: ListView.builder(
            itemCount: state.serials.length,
            itemBuilder: ((context, index) {
              return Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.3,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {
                        context.read<SerialsCubit>().addSerialToCard(index);
                      }),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
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
                              'assets/images/${state.serials[index].id + 1}.gif')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                state.serials[index].title,
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
                                  state.serials[index].price.toString(),
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
            backgroundColor: (state.cards.isEmpty) ? Colors.grey : Colors.green,
            onPressed: () {
              Navigator.of(context).pushNamed('ui/pages/card_page');
            },
            label: const Text('Перейти в корзину'),
          ),
        );
      },
    );
  }
}
