// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/responsive_builder.dart';

// 🌎 Project imports:
import 'package:crypto_app/ui/views/widgets/general_app_bar.dart';

void main() {
  final cogFinder = find.byKey(Key('settings-cog-buton'));
  final macosChevronFinder = find.byKey(Key('back-chevron-macos'));
  final otherOsChevronFinder = find.byKey(Key('back-chevron-other-os'));

  group('Android', () {
    var platform = TargetPlatform.android;
    group('mobile', () {
      var width = ResponsiveSizingConfig.instance.breakpoints.tablet - 1;

      testWidgets('On screen with no back page', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = Size(width, 800);

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

    group('tablet', () {
      var width = ResponsiveSizingConfig.instance.breakpoints.tablet;

      testWidgets('On screen with no back page', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = Size(width, 800);
        tester.binding.window.devicePixelRatioTestValue = 1.0;

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
  });

  group('iOS', () {
    var platform = TargetPlatform.iOS;
    group('mobile', () {
      var width = ResponsiveSizingConfig.instance.breakpoints.tablet - 1;

      testWidgets('On screen with no back page', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = Size(width, 800);

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

    group('tablet', () {
      var width = ResponsiveSizingConfig.instance.breakpoints.tablet;

      testWidgets('On screen with no back page', (WidgetTester tester) async {
        tester.binding.window.physicalSizeTestValue = Size(width, 800);
        tester.binding.window.devicePixelRatioTestValue = 1.0;

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