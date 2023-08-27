import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class WebsocketClient {
  Stream<int> getCounterStream(int start);
}

class FakeWebsocketClient implements WebsocketClient {
  @override
  Stream<int> getCounterStream(int start) async* {
    int i = start;

    while (true) {
      yield i++;
      await Future.delayed(
        const Duration(milliseconds: 1000),
      );
    }
  }
}

final websocketClientProvider = Provider<WebsocketClient>(
  (ref) {
    return FakeWebsocketClient();
  },
);

final counterProvider = StreamProvider.family<int, int>((ref, start) {
  final wsClient = ref.watch(websocketClientProvider);
  return wsClient.getCounterStream(start);
});
