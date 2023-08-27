import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/main.dart';

class CounterAppPage extends ConsumerWidget {
  const CounterAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For Finding Our Provider
    final AsyncValue<int> counter = ref.watch(counterProvider(0));
    //  we're make the widget to re-render again everytime that value changed !!

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter"),
      ),
      body: Center(
        child: Text(
          counter
              .when(
                data: (int value) => value,
                error: (Object e, _) => e,
                loading: () => 0,
              )
              .toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
