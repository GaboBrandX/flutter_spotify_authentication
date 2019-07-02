import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_spotify_authentication/flutter_spotify_authentication.dart';
import 'package:flutter_spotify_authentication/spotify_connection_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _token;

  Future<void> connectToSpotify() async {
    var spotifyAuthentication = FlutterSpotifyAuthentication();
    var result = await spotifyAuthentication.connectToSpotifyAndReturnToken(
      '2d2f9bedf6bf448e8ed4eb9a824cab24',
      [
        'streaming',
        'user-read-private',
        'user-read-email',
        'user-read-recently-played',
        'user-follow-read',
        'user-top-read',
        'user-library-read',
      ],
    );
    if (result.responseType == SpotifyResponseType.success) {
      setState(() => _token = result.accessToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Spotify auth example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: connectToSpotify,
                child: Text('Connect to Spotify'),
              ),
              Text('Token: $_token'),
            ],
          ),
        ),
      ),
    );
  }
}
