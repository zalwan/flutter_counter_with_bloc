import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/bloc_builder/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderPage extends StatelessWidget {
  BlocBuilderPage({super.key});

  Counter mycounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("bloc builder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            bloc: mycounter,
            buildWhen: (previous, current) {
              if (current % 2 == 0) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return Center(
                child: Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          // StreamBuilder(
          //   initialData: mycounter.initialData,
          //   stream: mycounter.stream,
          //   builder: (context, snapshot) {
          //     return Center(
          //       child: Text(
          //         "${snapshot.data}",
          //         style: const TextStyle(fontSize: 50),
          //       ),
          //     );
          //   },
          // ),
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
                    mycounter.decrement();
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
          ),
        ],
      ),
    );
  }
}
