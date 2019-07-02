#import "FlutterSpotifyAuthenticationPlugin.h"
#import <flutter_spotify_authentication/flutter_spotify_authentication-Swift.h>

@implementation FlutterSpotifyAuthenticationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSpotifyAuthenticationPlugin registerWithRegistrar:registrar];
}
@end
