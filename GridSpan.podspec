#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name                    = "GridSpan"
  s.version                 = "0.1.0"
  s.summary                 = "Screen scale aware grid layout helpers."
  s.homepage                = "https://github.com/dclelland/GridSpan"
  s.license                 = { :type => 'MIT' }
  s.author                  = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  s.source                  = { :git => "https://github.com/dclelland/GridSpan.git", :tag => "0.1.0" }
  s.platform                = :ios, '8.0'
  s.ios.deployment_target   = '8.0'
  s.ios.source_files        = 'GridSpan.swift'
  s.requires_arc            = true
end