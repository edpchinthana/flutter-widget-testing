// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fluttertesting/main.dart';

void main() {
  testWidgets('Text input smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

  //Initial state
    expect(find.text('Enter your name'), findsOneWidget);
    expect(find.text(''), findsOneWidget);


    //Type "Name" and press +
    await tester.enterText(find.byType(TextField), "Name");
    await tester.pump();

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Name'), findsNWidgets(2));
    expect(find.text('Enter your name'), findsNothing);

    //Clear text field and press +
    await tester.enterText(find.byType(TextField), "");
    await tester.pump();

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text(''), findsNWidgets(1));
    expect(find.text('Enter your name'), findsOneWidget);

  });
}
