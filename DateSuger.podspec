#
#  Be sure to run `pod spec lint DateSuger.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name = 'DateSuger'
  s.version = '0.1.1'
  s.summary = 'Make NSDate much more easier to use'
  s.homepage = 'https://github.com/danisfabric/DateSuger'
  s.license = 'MIT'
  s.author = { 'DanisFabric' => 'danisfabric@gmail.com' }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source = { :git => 'https://github.com/danisfabric/DateSuger.git', :tag => s.version.to_s}
  s.source_files = 'Source/*.swift'
  s.requires_arc = true

end
