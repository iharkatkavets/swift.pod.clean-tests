#
# Be sure to run `pod lib lint CleanTests.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CleanTests'
  s.version          = '0.1.0'
  s.summary          = 'XCTest extensions to write clean test.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
XCTest extensions which I often use to write clean tests. Inspired by Robert C.Martin's book Clean Code.
                       DESC

  s.homepage         = 'https://github.com/igorkotkovets/pod.swift.clean-tests'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Igor Kotkovets' => 'igorkotkovets@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/igorkotkovets/pod.swift.clean-tests.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '10.0'
  s.osx.deployment_target = '10.10'

  s.source_files = 'CleanTests/Classes/**/*'
  s.weak_framework = "XCTest"
  s.requires_arc = true
  s.pod_target_xcconfig = {
    'ENABLE_BITCODE' => 'NO',
    'OTHER_LDFLAGS' => '-weak-lswiftXCTest',
    'OTHER_SWIFT_FLAGS' => '$(inherited) -suppress-warnings',
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "$(PLATFORM_DIR)/Developer/Library/Frameworks"',
  }
  # s.resource_bundles = {
  #   'CleanTests' => ['CleanTests/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
