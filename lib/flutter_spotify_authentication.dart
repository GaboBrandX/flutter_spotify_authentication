import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_spotify_authentication/spotify_authentication_response.dart';

class FlutterSpotifyAuthentication {
  MethodChannel _channel = const MethodChannel('flutter_spotify_authentication');

  Future<SpotifyAuthenticationResponse> connectToSpotifyAndReturnToken(String spotifyClientId, List<String> scopes) async {
    final Map<dynamic, dynamic> response = await _channel.invokeMethod(
      'connectToSpotify',
      {
        'spotifyClientId': spotifyClientId,
        'scopes': scopes,
      },
    );
    return SpotifyAuthenticationResponse(
      SpotifyAuthenticationResponseType.values[response['responseType']],
      accessToken: response['accessToken'],
      error: response['error'],
      code: response['code'],
      expiresIn: response['expiresIn'],
      state: response['state'],
    );
  }
}
