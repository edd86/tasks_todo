//import 'package:flutter_riverpod/legacy.dart';

//final obscureProvider = StateProvider<bool>((ref) => true);

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscureProvider extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void toggleObscure() {
    state = !state;
  }
}

final obscureProvider = NotifierProvider<ObscureProvider, bool>(
  ObscureProvider.new,
);
