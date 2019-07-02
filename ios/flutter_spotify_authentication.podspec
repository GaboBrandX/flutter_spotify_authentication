#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_spotify_authentication'
  s.version          = '0.0.1'
  s.summary          = 'Spotify Authentication Library integration for obtaining OAuth access tokens that can be used to play music or in calls to the Spotify Web API.'
  s.description      = <<-DESC
Spotify Authentication Library integration for obtaining OAuth access tokens that can be used to play music or in calls to the Spotify Web API.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
end

