// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/views/widgets/general_app_bar.dart';

void main() {
  final cogFinder = find.byKey(Key('settings-cog-buton'));
  final macosChevronFinder = find.byKey(Key('back-chevron-macos'));
  final otherOsChevronFinder = find.byKey(Key('back-chevron-other-os'));

  group('Android', () {
    var platform = TargetPlatform.android;

    testWidgets('On screen with no back page', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        appBar: GeneralAppBar(
            title: Text('title'),
            actions: [],
            platform: platform,
            hasBackRoute: false),
      )));

      expect(cogFinder, findsOneWidget);
      expect(macosChevronFinder, findsNothing);
      expect(otherOsChevronFinder, findsNothing);

      final baseSize = tester.getSize(find.byType(AppBar));
      expect(baseSize.height, 56);
    });
    testWidgets('On screen with back page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: GeneralAppBar(
                title: Text('title'),
                actions: [],
                platform: platform,
                hasBackRoute: true),
          ),
        ),
      );

      expect(cogFinder, findsNothing);
      expect(macosChevronFinder, findsNothing);
      expect(otherOsChevronFinder, findsOneWidget);
      final baseSize = tester.getSize(find.byType(AppBar));
      expect(baseSize.height, 56);
    });
  });
  group('MacOS', () {
    var platform = TargetPlatform.macOS;

    testWidgets('On screen with no back page', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        appBar: GeneralAppBar(
            title: Text('title'),
            actions: [],
            platform: platform,
            hasBackRoute: false),
      )));

      expect(cogFinder, findsNothing);
      expect(macosChevronFinder, findsNothing);
      expect(otherOsChevronFinder, findsNothing);

      final baseSize = tester.getSize(find.byType(AppBar));
      expect(baseSize.height, 38);
    });
    testWidgets('On screen with back page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: GeneralAppBar(
                title: Text('title'),
                actions: [],
                platform: platform,
                hasBackRoute: true),
          ),
        ),
      );

      expect(cogFinder, findsNothing);
      expect(macosChevronFinder, findsOneWidget);
      expect(otherOsChevronFinder, findsNothing);
      final baseSize = tester.getSize(find.byType(AppBar));
      expect(baseSize.height, 38);
    });
  });
}
