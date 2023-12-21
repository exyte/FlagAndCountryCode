Pod::Spec.new do |s|
  s.name             = "FlagAndCountryCode"
  s.version          = "1.0.2"
  s.summary          = "FlagAndCountryCode is a collection of flags and other country-related metadata for custom phone picker components and other uses"

  s.homepage         = 'https://github.com/exyte/FlagAndCountryCode.git'
  s.license          = 'MIT'
  s.author           = { 'Exyte' => 'info@exyte.com' }
  s.source           = { :git => 'https://github.com/exyte/FlagAndCountryCode.git', :tag => s.version.to_s }
  s.social_media_url = 'http://exyte.com'

  s.ios.deployment_target = '15.0'
  
  s.requires_arc = true
  s.swift_version = "5.7"

  s.source_files = [
     'Sources/*.h',
     'Sources/*.swift',
     'Sources/**/*.swift',
     'SourcesFlagAndCountryCode/**/*.swift'
  ]

  s.resources = "Sources/FlagAndCountryCode/Resources/**/*"

end
