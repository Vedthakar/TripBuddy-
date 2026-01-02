import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_buddy/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TripBuddyApp());

    // Verify that the app loads
    expect(find.byType(MainNavigationScreen), findsOneWidget);
    
    // Verify bottom navigation bar exists
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}