#
# Be sure to run `pod lib lint CleanTests.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = 'CleanTests'
  s.version          = '0.1.0'
  s.summary          = 'XCTest extensions to write clean test.'
  s.description      = <<-DESC
XCTest extensions which I often use to write clean tests. Inspired by Robert C.Martin's book "Clean Code" and Rambler's sessions.
                       DESC
  s.homepage         = 'https://github.com/igorkotkovets/pod.swift.clean-tests'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Igor Kotkovets' => 'igorkotkovets@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/igorkotkovets/pod.swift.clean-tests.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
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
end
