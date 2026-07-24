import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:hikimar_yara/main.dart';

void main() {
  testWidgets('Hikimar Yara app loads successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(const HikimarYaraApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}