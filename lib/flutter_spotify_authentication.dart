import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_spotify_authentication/spotify_connection_result.dart';

class FlutterSpotifyAuthentication {
  MethodChannel _channel = const MethodChannel('flutter_spotify_authentication');

  Future<SpotifyConnectionResult> connectToSpotifyAndReturnToken(String spotifyClientId, List<String> scopes) async {
    final String token = await _channel.invokeMethod(
      'connectToSpotify',
      {
        'spotifyClientId': spotifyClientId,
        'scopes': scopes,
      },
    );
    return SpotifyConnectionResult(SpotifyResponseType.success, accessToken: token);
  }
}
