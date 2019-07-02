class SpotifyAuthenticationResponse {
  SpotifyAuthenticationResponseType responseType;
  String accessToken;
  String code;
  String error;
  String state;
  int expiresIn;

  SpotifyAuthenticationResponse(
    this.responseType, {
    this.code,
    this.accessToken,
    this.error,
    this.state,
    this.expiresIn,
  });
}

enum SpotifyAuthenticationResponseType {
  code,
  token,
  error,
  empty,
  unknown,
}
