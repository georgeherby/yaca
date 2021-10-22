import 'package:crypto_app/core/exceptions/unsupported_device_exceptions.dart';
import 'package:crypto_app/ui/utils/screen_chooser/screen_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeviceType', () {
    group('is MobileNotWeb', () {
      test('if android', () {
        expect(getDeviceType(TargetPlatform.android, false),
            equals(DeviceType.mobileNotWeb));
      });
      test('if ios', () {
        expect(getDeviceType(TargetPlatform.android, false),
            equals(DeviceType.mobileNotWeb));
      });
    });
    group('is MobileWeb', () {
      test('if android', () {
        expect(getDeviceType(TargetPlatform.android, true),
            equals(DeviceType.mobile));
      });
      test('if ios', () {
        expect(getDeviceType(TargetPlatform.android, true),
            equals(DeviceType.mobile));
      });
    });
    group('is DesktopWeb', () {
      test('if macOS', () {
        expect(getDeviceType(TargetPlatform.macOS, true),
            equals(DeviceType.desktop));
      });
      test('if Windows', () {
        expect(getDeviceType(TargetPlatform.windows, true),
            equals(DeviceType.desktop));
      });
      test('if Linux', () {
        expect(getDeviceType(TargetPlatform.linux, true),
            equals(DeviceType.desktop));
      });
    });
    group('is DesktopNotWeb', () {
      test('if macOS', () {
        expect(getDeviceType(TargetPlatform.macOS, false),
            equals(DeviceType.desktopNotWeb));
      });
      test('if Windows', () {
        expect(getDeviceType(TargetPlatform.windows, false),
            equals(DeviceType.desktopNotWeb));
      });
      test('if Linux', () {
        expect(getDeviceType(TargetPlatform.linux, false),
            equals(DeviceType.desktopNotWeb));
      });
    });
    group('unsupported', () {
      group('web', () {
        test('if Fuchsia', () {
          expect(
              () => getDeviceType(TargetPlatform.fuchsia, true),
              throwsA(predicate((e) =>
                  e is UnsupportedDevice &&
                  e.cause == 'TargetPlatform.fuchsia, isWeb true')));
        });
      });
      group('web', () {
        test('if Fuchsia', () {
          expect(
              () => getDeviceType(TargetPlatform.fuchsia, false),
              throwsA(predicate((e) =>
                  e is UnsupportedDevice &&
                  e.cause == 'TargetPlatform.fuchsia, isWeb false')));
        });
      });
    });
  });

  group('ScreenSize', () {
    group('is Mobile', () {
      group('web', () {
        test('if width is 599, height 600 (android)', () {
          var result =
              getScreenSize(Size(599, 600), TargetPlatform.android, true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (android)', () {
          var result =
              getScreenSize(Size(600, 599), TargetPlatform.android, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 949, height 950 (android)', () {
          var result =
              getScreenSize(Size(949, 950), TargetPlatform.android, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 949 (android)', () {
          var result =
              getScreenSize(Size(950, 949), TargetPlatform.android, true);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 599, height 600 (iOS)', () {
          var result = getScreenSize(Size(599, 600), TargetPlatform.iOS, true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 950, height 949 (iOS)', () {
          var result = getScreenSize(Size(950, 949), TargetPlatform.iOS, true);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 949, height 950 (iOS)', () {
          var result = getScreenSize(Size(949, 950), TargetPlatform.iOS, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 600, height 599 (iOS)', () {
          var result = getScreenSize(Size(600, 599), TargetPlatform.iOS, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 599, height 600 (macOS)', () {
          var result =
              getScreenSize(Size(599, 600), TargetPlatform.macOS, true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (macOS)', () {
          var result =
              getScreenSize(Size(600, 599), TargetPlatform.macOS, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 949, height 950 (macOS)', () {
          var result =
              getScreenSize(Size(949, 950), TargetPlatform.macOS, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 949 (macOS)', () {
          var result =
              getScreenSize(Size(950, 949), TargetPlatform.macOS, true);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 599, height 600 (windows)', () {
          var result =
              getScreenSize(Size(599, 600), TargetPlatform.windows, true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (windows)', () {
          var result =
              getScreenSize(Size(600, 599), TargetPlatform.windows, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 949, height 950 (windows)', () {
          var result =
              getScreenSize(Size(949, 950), TargetPlatform.windows, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 949 (windows)', () {
          var result =
              getScreenSize(Size(950, 949), TargetPlatform.windows, true);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 599, height 600 (linux)', () {
          var result =
              getScreenSize(Size(599, 600), TargetPlatform.linux, true);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (linux)', () {
          var result =
              getScreenSize(Size(600, 599), TargetPlatform.linux, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 949, height 950 (linux)', () {
          var result =
              getScreenSize(Size(949, 950), TargetPlatform.linux, true);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 949 (linux)', () {
          var result =
              getScreenSize(Size(950, 949), TargetPlatform.linux, true);
          expect(result, equals(ScreenSize.large));
        });
      });
      group('not web', () {
        test('if width is 600, height 599 (android)', () {
          var result =
              getScreenSize(Size(600, 599), TargetPlatform.android, false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 599, height 600 (android)', () {
          var result =
              getScreenSize(Size(599, 600), TargetPlatform.android, false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 949 (android)', () {
          var result =
              getScreenSize(Size(600, 949), TargetPlatform.android, false);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 1000, height 600 (android)', () {
          var result =
              getScreenSize(Size(1000, 950), TargetPlatform.android, false);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 600, height 599 (ios)', () {
          var result = getScreenSize(Size(600, 599), TargetPlatform.iOS, false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 599, height 600 (ios)', () {
          var result = getScreenSize(Size(599, 600), TargetPlatform.iOS, false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 949 (ios)', () {
          var result = getScreenSize(Size(600, 949), TargetPlatform.iOS, false);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 1000, height 600 (ios)', () {
          var result =
              getScreenSize(Size(1000, 950), TargetPlatform.iOS, false);
          expect(result, equals(ScreenSize.large));
        });

        test('if width is 599, height 600 (macOS)', () {
          var result =
              getScreenSize(Size(599, 600), TargetPlatform.macOS, false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (macOS)', () {
          var result =
              getScreenSize(Size(600, 599), TargetPlatform.macOS, false);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 599 (macOS)', () {
          var result =
              getScreenSize(Size(950, 599), TargetPlatform.macOS, false);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 599, height 600 (windows)', () {
          var result =
              getScreenSize(Size(599, 600), TargetPlatform.windows, false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 950, height 599 (windows)', () {
          var result =
              getScreenSize(Size(950, 599), TargetPlatform.windows, false);
          expect(result, equals(ScreenSize.large));
        });
        test('if width is 600, height 599 (windows)', () {
          var result =
              getScreenSize(Size(600, 599), TargetPlatform.windows, false);
          expect(result, equals(ScreenSize.medium));
        });

        test('if width is 599, height 600 (linux)', () {
          var result =
              getScreenSize(Size(599, 600), TargetPlatform.linux, false);
          expect(result, equals(ScreenSize.small));
        });
        test('if width is 600, height 599 (linux)', () {
          var result =
              getScreenSize(Size(600, 599), TargetPlatform.linux, false);
          expect(result, equals(ScreenSize.medium));
        });
        test('if width is 950, height 599 (linux)', () {
          var result =
              getScreenSize(Size(950, 599), TargetPlatform.linux, false);
          expect(result, equals(ScreenSize.large));
        });
      });
    });
  });
}
