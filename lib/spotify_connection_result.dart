class SpotifyConnectionResult {
  SpotifyResponseType responseType;
  String accessToken;
  String error;

  SpotifyConnectionResult(
    this.responseType, {
    this.accessToken,
    this.error,
  });
}

enum SpotifyResponseType {
  success,
  error,
  canceled,
}
