#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint focus_toast_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'focus_toast_plugin'
  s.version          = '0.0.1'
  s.summary          = 'A plugin for focus toast notifications'
  s.description      = <<-DESC
A plugin for focus toast notifications with sound and window management.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
