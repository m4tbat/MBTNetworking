Pod::Spec.new do |s|
  s.name             = "MBTNetworking"
  s.version          = "0.1.3"
  s.summary          = "A simple networking library for iOS based on AFNetworking 2 and Mantle."
  s.description      = <<-DESC
                       A simple networking library for iOS based on AFNetworking 2 and Mantle.
                       The aim of MBTNetworking is to streamline the implementation of
                       requests to REST APIs and the mapping of the response objects to
                       model objects.
                       DESC
  s.homepage         = "https://github.com/madbat/MBTNetworking"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Matteo Battaglio" => "m4dbat@gmail.com" }
  s.source           = { :git => "https://github.com/madbat/MBTNetworking.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/m4dbat'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.{h,m}', 'Pod/Classes/**/*.{h,m}'
  # s.resources = 'Pod/Assets/*.png'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Mantle', '~> 1.5'
end
