import 'package:flutter_test/flutter_test.dart';
import 'package:dashboard_white_label/app/modules/main/main_store.dart';
 
void main() {
  late MainStore store;

  setUpAll(() {
    store = MainStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}