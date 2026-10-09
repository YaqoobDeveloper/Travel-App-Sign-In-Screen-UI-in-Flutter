import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_screen/app.dart';

void main() {
  setUp(() => GoogleFonts.config.allowRuntimeFetching = false);

  Future<void> pumpApp(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const App());
  }

  testWidgets('Sign in with empty fields shows validation errors', (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.text('Sign in now'));
    await tester.pump();
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Valid sign in shows a confirmation', (tester) async {
    await pumpApp(tester);

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'khalil@gmail.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'secret123');
    await tester.tap(find.text('Sign in now'));
    await tester.pump();
    expect(find.text('Signed in as khalil@gmail.com'), findsOneWidget);
  });

  testWidgets('Tapping a social option selects it', (tester) async {
    await pumpApp(tester);

    await tester.ensureVisible(find.text('Apple'));
    await tester.tap(find.text('Apple'));
    await tester.pump();
    expect(find.text('Continue with Apple'), findsOneWidget);
  });
}
