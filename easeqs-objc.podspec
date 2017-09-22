#
# Be sure to run `pod lib lint easeqs-objc.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |spec|

  spec.name                  = 'easeqs-objc'
  spec.version               = '0.1.0'
  spec.summary               = 'An easing equations for your purposes and some additionals for keyframe animations'
  spec.homepage              = 'https://github.com/nikburnt/easeqs-objc'
  spec.author                = { 'Nik Burnt' => 'nikburnt@gmail.com' }
  spec.source                = { :git => 'https://github.com/nikburnt/easeqs-objc.git', :tag => spec.version.to_s }
  spec.license               = { :type => 'MIT', :file => 'LICENSE' }

  spec.ios.deployment_target = '9.0'

  spec.requires_arc          = true

  spec.source_files          = 'Sources/**/*.{h,m}'

  spec.public_header_files   = 'Sources/**/*.h'
  
end
