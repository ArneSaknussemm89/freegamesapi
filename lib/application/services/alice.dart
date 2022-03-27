import 'package:alice/alice.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/constants.dart';

// A provider for the Alice instance.
final aliceProvider = Provider<Alice>((ref) {
  return Alice(
    showNotification: false,
    navigatorKey: navigatorKey,
    darkTheme: true,
  );
});
