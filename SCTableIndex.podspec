#
# Be sure to run `pod lib lint SCTableIndex.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SCTableIndex'
  s.version          = '0.1.1'
  s.summary          = 'SCTableIndex is tableview item index list not use section Header'

  s.description      = 'SCTableIndex is tableview item index list not use section Header. If you set the sorted item as a string array, it makes a table of contents with the first letter. Then click on the letter to move the table view to the first item.'

  s.homepage         = 'https://github.com/myoungsc/SCTableIndex'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'myoungsc' => 'myoungsc.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/myoungsc/SCTableIndex.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'SCTableIndex/Classes/**/*'
  
end
