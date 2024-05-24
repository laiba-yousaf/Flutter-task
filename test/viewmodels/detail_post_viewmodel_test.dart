import 'package:flutter_test/flutter_test.dart';
import 'package:task_flutter/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DetailPostViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}