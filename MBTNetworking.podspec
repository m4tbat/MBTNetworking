Pod::Spec.new do |s|
  s.name             = "MBTNetworking"
  s.version          = "0.4"
  s.summary          = "A simple networking library for iOS based on AFNetworking 2, Mantle and PromiseKit."
  s.description      = <<-DESC
                          A simple networking library for iOS based on AFNetworking 2, Mantle and PromiseKit.
                          The aim of MBTNetworking is to streamline the implementation of
                          requests to REST APIs and the mapping of the response objects to
                          model objects.
                       DESC
  s.homepage         = "https://github.com/madbat/MBTNetworking"
  s.license          = 'MIT'
  s.author           = { "Matteo Battaglio" => "m4dbat@gmail.com" }
  s.source           = { :git => "https://github.com/madbat/MBTNetworking.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/m4dbat'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MBTNetworking' => ['Pod/Assets/*.png']
  }
  
  s.dependency 'AFNetworking', '~> 2.5'
  s.dependency 'Mantle', '~> 2.0'
  s.dependency 'PromiseKit/Promise', '~> 1.2'
end
