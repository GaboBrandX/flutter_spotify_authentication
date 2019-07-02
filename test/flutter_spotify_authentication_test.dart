import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_spotify_authentication/flutter_spotify_authentication.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_spotify_authentication');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterSpotifyAuthentication.platformVersion, '42');
  });
}
