// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:yaca/ui/utils/screen_chooser/screen_chooser.dart';

void main() {
  group('ScreenSize', () {
    group('is Mobile', () {
      group('web', () {
        test('if width is 599, height 600 (android)', () {
          final result = getScreenSize(
              const Size(599, 600), TargetPlatform.android,
              isWeb: true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (android)', () {
          final result = getScreenSize(
              const Size(600, 599), TargetPlatform.android,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 949, height 950 (android)', () {
          final result = getScreenSize(
              const Size(949, 950), TargetPlatform.android,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 949 (android)', () {
          final result = getScreenSize(
              const Size(950, 949), TargetPlatform.android,
              isWeb: true);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 599, height 600 (iOS)', () {
          final result = getScreenSize(const Size(599, 600), TargetPlatform.iOS,
              isWeb: true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 950, height 949 (iOS)', () {
          final result = getScreenSize(const Size(950, 949), TargetPlatform.iOS,
              isWeb: true);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 949, height 950 (iOS)', () {
          final result = getScreenSize(const Size(949, 950), TargetPlatform.iOS,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 600, height 599 (iOS)', () {
          final result = getScreenSize(const Size(600, 599), TargetPlatform.iOS,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 599, height 600 (macOS)', () {
          final result = getScreenSize(
              const Size(599, 600), TargetPlatform.macOS,
              isWeb: true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (macOS)', () {
          final result = getScreenSize(
              const Size(600, 599), TargetPlatform.macOS,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 949, height 950 (macOS)', () {
          final result = getScreenSize(
              const Size(949, 950), TargetPlatform.macOS,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 949 (macOS)', () {
          final result = getScreenSize(
              const Size(950, 949), TargetPlatform.macOS,
              isWeb: true);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 599, height 600 (windows)', () {
          final result = getScreenSize(
              const Size(599, 600), TargetPlatform.windows,
              isWeb: true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (windows)', () {
          final result = getScreenSize(
              const Size(600, 599), TargetPlatform.windows,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 949, height 950 (windows)', () {
          final result = getScreenSize(
              const Size(949, 950), TargetPlatform.windows,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 949 (windows)', () {
          final result = getScreenSize(
              const Size(950, 949), TargetPlatform.windows,
              isWeb: true);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 599, height 600 (linux)', () {
          final result = getScreenSize(
              const Size(599, 600), TargetPlatform.linux,
              isWeb: true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (linux)', () {
          final result = getScreenSize(
              const Size(600, 599), TargetPlatform.linux,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 949, height 950 (linux)', () {
          final result = getScreenSize(
              const Size(949, 950), TargetPlatform.linux,
              isWeb: true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 949 (linux)', () {
          final result = getScreenSize(
              const Size(950, 949), TargetPlatform.linux,
              isWeb: true);
          expect(result, equals(ScreenSize.large));
        });
      });
      group('not web', () {
        test('if width is 600, height 599 (android)', () {
          final result = getScreenSize(
              const Size(600, 599), TargetPlatform.android,
              isWeb: false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 599, height 600 (android)', () {
          final result = getScreenSize(
              const Size(599, 600), TargetPlatform.android,
              isWeb: false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 949 (android)', () {
          final result = getScreenSize(
              const Size(600, 949), TargetPlatform.android,
              isWeb: false);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 1000, height 600 (android)', () {
          final result = getScreenSize(
              const Size(1000, 950), TargetPlatform.android,
              isWeb: false);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 600, height 599 (ios)', () {
          final result = getScreenSize(const Size(600, 599), TargetPlatform.iOS,
              isWeb: false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 599, height 600 (ios)', () {
          final result = getScreenSize(const Size(599, 600), TargetPlatform.iOS,
              isWeb: false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 949 (ios)', () {
          final result = getScreenSize(const Size(600, 949), TargetPlatform.iOS,
              isWeb: false);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 1000, height 600 (ios)', () {
          final result = getScreenSize(
              const Size(1000, 950), TargetPlatform.iOS,
              isWeb: false);
          expect(result, equals(ScreenSize.large));
        });

        test('if width is 599, height 600 (macOS)', () {
          final result = getScreenSize(
              const Size(599, 600), TargetPlatform.macOS,
              isWeb: false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (macOS)', () {
          final result = getScreenSize(
              const Size(600, 599), TargetPlatform.macOS,
              isWeb: false);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 599 (macOS)', () {
          final result = getScreenSize(
              const Size(950, 599), TargetPlatform.macOS,
              isWeb: false);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 599, height 600 (windows)', () {
          final result = getScreenSize(
              const Size(599, 600), TargetPlatform.windows,
              isWeb: false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 950, height 599 (windows)', () {
          final result = getScreenSize(
              const Size(950, 599), TargetPlatform.windows,
              isWeb: false);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 600, height 599 (windows)', () {
          final result = getScreenSize(
              const Size(600, 599), TargetPlatform.windows,
              isWeb: false);
          expect(result, equals(ScreenSize.medium));
        });

        test('if width is 599, height 600 (linux)', () {
          final result = getScreenSize(
              const Size(599, 600), TargetPlatform.linux,
              isWeb: false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (linux)', () {
          final result = getScreenSize(
              const Size(600, 599), TargetPlatform.linux,
              isWeb: false);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 599 (linux)', () {
          final result = getScreenSize(
              const Size(950, 599), TargetPlatform.linux,
              isWeb: false);
          expect(result, equals(ScreenSize.large));
        });
      });
    });
  });
}
