# flutter_spotify_authentication

This plugin is a bridge between the Spotify Authentication SDK (only for Android by now) and Flutter. It allows you to authenticate your users using the Spotify app and receive OAuth access tokens for calls than can be used to play music or used in calls to the Spotify Web API.

You can find more info on the [Spotify for Devevelopers docs](https://developer.spotify.com/documentation/android/).

## How to use

Add this activity to your AndroidManifest.xml

```
<activity
  android:name="com.spotify.sdk.android.authentication.LoginActivity"
  android:theme="@android:style/Theme.Translucent.NoTitleBar" />
```

Than you can implement it with this code:

```
  connectToSpotify() async {
    FlutterSpotifyAuthentication spotifyAuthentication = FlutterSpotifyAuthentication();
    SpotifyAuthenticationResponse result = await spotifyAuthentication.connectToSpotifyAndReturnToken(
      'YOUR_CLIENT_ID',
      // Pass your needed scopes
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
  }
```

The SpotifyAuthenticationResponse contains the `accessToken` in case of successful operation.

## Future updates

I'm working on iOS integration for now.

