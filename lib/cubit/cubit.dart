import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  void increment() {
    emit(state + 1);
  }

  void decrement(BuildContext context) {
    if (state > 0) {
      emit(state - 1);
    } else {
      emit(0);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Peringatan'),
            content: const Text('Angka tidak boleh nol'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class CubitPage extends StatelessWidget {
  //const CubitPage({super.key});
  CubitPage({super.key});

  CounterCubit mycounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cubit App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: mycounter.initialData,
            stream: mycounter.stream,
            builder: (context, snapshot) {
              return Center(
                child: Text(
                  "${snapshot.data}",
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                    mycounter.decrement(context);
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 35,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                    mycounter.increment();
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 35,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
