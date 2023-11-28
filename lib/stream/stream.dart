import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({super.key});

  Stream<int> countStream() async* {
    for (int i = 10; i >= 1; i--) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Stream App"),
      ),
      body: StreamBuilder(
        stream: countStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                "LOADING",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "${snapshot.data}",
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
